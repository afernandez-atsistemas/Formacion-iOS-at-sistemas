//
//  PokemonProvider.swift
//  CursoiOSProyecto3_Base
//
//  Created by Abrahán Fernández on 1/2/21.
//

import Foundation
import PromiseKit

class PokemonNetworkProvider: BaseNetworkProvider, PokemonProviderContract {
    enum PokemonURLEntries {
        case kInitialPage
        case kDetailPokemon(String)
    }

    enum PokemonNetworkError: Error {
        case initialPageLoadError, detailPageLoadError
    }

    let kAPIResultsKey = "results"
    let kAPIUrlKey = "url"

    func getPokemons() -> Promise<[PokemonDAO]> {
        var detailPagePromise: [Promise<PokemonDAO>] = []

        return Promise<[PokemonDAO]> { promise in

            self.getInitialPage().done { initialPage in
                for element in initialPage {
                    if let detailUrl = element[self.kAPIUrlKey] {
                        detailPagePromise.append(self.getPokemonDetail(fullURLString: detailUrl))
                    }
                }

                when(resolved: detailPagePromise).done { results in
                    var fullfilledPromiseValues: [PokemonDAO] = []
                    for case .fulfilled(let value) in results {
                        // These promises succeeded, and the values will be what is return from
                        // the last promises in chain1 and chain2
                        print("Promise value is: \(value)")
                        fullfilledPromiseValues.append(value)
                    }

                    debugPrint(results)

                    promise.fulfill(fullfilledPromiseValues)
                }.catch { error in
                    debugPrint(error)
                    //promise.reject(error)
                }
            }.catch { error in
                promise.reject(error)
            }
        }
    }

    private func getUrl(service: PokemonURLEntries) -> URL {
        switch service {
        case .kInitialPage:
            return URL(string: "https://pokeapi.co/api/v2/pokemon/")!
        case .kDetailPokemon(let pokemonId):
            return URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemonId)/")!
        }
    }

    private func getInitialPage() -> Promise<[[String: String]]> {
        return Promise<[[String: String]]> { promise in
            sessionManager.request(getUrl(service: .kInitialPage)).responseJSON { response in
                guard let initialData = try? response.result.get() as? [String: Any],
                      let initialDataResults = initialData[self.kAPIResultsKey] as? [[String: String]] else {
                    promise.reject(PokemonNetworkError.initialPageLoadError)
                    return
                }

                promise.fulfill(initialDataResults)
            }
        }
    }

    private func getPokemonDetail(fullURLString: String) -> Promise<PokemonDAO> {
        return Promise<PokemonDAO> { promise in
            sessionManager.request(fullURLString).responseJSON { response in
                guard let detailPageData = try? response.result.get() as? [String: Any] else {
                    promise.reject(PokemonNetworkError.detailPageLoadError)
                    return
                }

                if let pokemonDAO = try? PokemonDAO(JSON: detailPageData) {
                    promise.fulfill(pokemonDAO)
                } else {
                    promise.reject(PokemonNetworkError.detailPageLoadError)
                }
            }
        }
    }
}
