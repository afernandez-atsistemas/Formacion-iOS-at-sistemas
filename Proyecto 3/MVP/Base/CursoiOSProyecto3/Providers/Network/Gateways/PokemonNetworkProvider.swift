//
//  PokemonProvider.swift
//  CursoiOSProyecto3_Base
//
//  Created by Abrahán Fernández on 1/2/21.
//

import Foundation
import PromiseKit

protocol PokemonProviderContract {
    func getPokemons() -> Promise<[Pokemon]>
}

class PokemonNetworkProvider: BaseNetworkProvider, PokemonProviderContract {
    func getPokemons() -> Promise<[Pokemon]> {
        return Promise {
            $0.fulfill([Pokemon()])
        }
    }
}
