//
//  PokemonListInteractor.swift
//  CursoiOSProyecto3_Base
//
//  Created by Abrahán Fernández on 1/2/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import PromiseKit

class PokemonListInteractor: BaseInteractor, PokemonListInteractorContract {
    weak var output: PokemonListInteractorOutputContract?

    var pokemonProvider: PokemonProviderContract
    
    init (pokemonProvider: PokemonProviderContract) {
        self.pokemonProvider = pokemonProvider
    }

    // MARK: - Public methods
    func getPokemonsList() -> Promise<[Pokemon]> {
        return Promise<[Pokemon]> { promise in
            firstly {
                self.pokemonProvider.getPokemons()
            }.done { pokemonsDAOList in
                let pokemonsList = pokemonsDAOList.map { Pokemon(pokemonDAO: $0) }
                
                promise.fulfill(pokemonsList)
            }
        }
    }
}
