//
//  PokemonDetailInteractor.swift
//  CursoiOSProyecto3
//
//  Created by Abrahán Fernández on 8/2/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

class PokemonDetailInteractor: BaseInteractor, PokemonDetailInteractorContract {
    weak var output: PokemonDetailInteractorOutputContract!

    var networkProvider: PokemonNetworkProvider
    var pokemon: Pokemon
    
    init(provider: PokemonNetworkProvider, pokemon: Pokemon) {
        self.networkProvider = provider
        self.pokemon = pokemon
    }

    func getPokemonData() -> Pokemon {
        return pokemon
    }
}
