//
//  PresistencyRealmProvider.swift
//  CursoiOSProyecto3
//
//  Created by Abrahán Fernández on 10/3/21.
//

import Foundation
import RealmSwift
import PromiseKit

class PersistencyRealmProvider: PersistencyProviderContract {
    private let kBackgroundQueue = "background"

    func savePokemon(pokemon: Pokemon) -> Promise<Void> {
        return Promise<Void> { promise in
            let pokemonRealmDAO = PokemonRealmDAO(pokemon: pokemon)

            // Query and update from any thread
            DispatchQueue(label: kBackgroundQueue).async {
                do {
                    let realm = try Realm()
                    try realm.write {
                        realm.add(pokemonRealmDAO)
                        promise.fulfill(())
                    }
                } catch {
                    promise.reject(PersistencyError.databaseError)
                }
            }
        }
    }

    func getPokemonsFromPersistency() -> Promise<[Pokemon]> {
        return Promise<[Pokemon]> { promise in
            do {
                let realm = try Realm()
                let pokemons = Array(realm.objects(PokemonRealmDAO.self)) //.filter("name == Bulbasur").first
                let pokemonResult = pokemons.map { self.mapPokemonRealmDAOIntoPokemoModel(pokemonRealmDAO: $0) }

                promise.fulfill(pokemonResult)
            } catch {
                promise.reject(PersistencyError.databaseError)
            }
        }
    }

    private func mapPokemonRealmDAOIntoPokemoModel(pokemonRealmDAO: PokemonRealmDAO) -> Pokemon {
        return Pokemon(name: pokemonRealmDAO.name, fav: pokemonRealmDAO.fav)
    }
}
