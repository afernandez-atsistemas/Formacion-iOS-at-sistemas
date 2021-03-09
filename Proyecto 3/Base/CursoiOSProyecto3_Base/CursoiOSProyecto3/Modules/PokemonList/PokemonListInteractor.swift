//
//  PokemonListInteractor.swift
//  CursoiOSProyecto3_Base
//
//  Created by Abrahán Fernández on 1/2/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

class PokemonListInteractor: BaseInteractor, PokemonListInteractorContract {
    weak var output: PokemonListInteractorOutputContract?

    var pokemonProvider: PokemonProviderContract
    
    init (pokemonProvider: PokemonProviderContract) {
        self.pokemonProvider = pokemonProvider
    }
}
