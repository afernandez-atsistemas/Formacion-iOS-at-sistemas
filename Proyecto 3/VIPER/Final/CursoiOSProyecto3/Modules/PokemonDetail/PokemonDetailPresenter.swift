//
//  PokemonDetailPresenter.swift
//  CursoiOSProyecto3
//
//  Created by Abrahán Fernández on 8/2/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

class PokemonDetailPresenter: BasePresenter, PokemonDetailPresenterContract {

    weak var view: PokemonDetailViewContract!
    var interactor: PokemonDetailInteractorContract!
    var entity: PokemonDetailEntityContract!
    var wireframe: PokemonDetailWireframeContract!

    func viewDidLoad() {

    }

    func viewWillAppear() {
        let pokemonData = interactor.getPokemonData()
        view.reloadViewWithData(pokemon: pokemonData)
    }
}

// MARK: - PokemonDetailInteractorOutputContract
extension PokemonDetailPresenter: PokemonDetailInteractorOutputContract {
    
}

// MARK: - PokemonDetailWireframeOutputContract
extension PokemonDetailPresenter: PokemonDetailWireframeOutputContract {
    
}
