//
//  PokemonListBuilder.swift
//  CursoiOSProyecto3_Base
//
//  Created by Abrahán Fernández on 1/2/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class PokemonListBuilder {

    static func build() -> PokemonListView {
        let view = PokemonListView.init(nibName: String(describing: PokemonListView.self), bundle: nil)
        let presenter = PokemonListPresenter()
        let entity = PokemonListEntity()
        let wireframe = PokemonListWireframe()
        
        let provider = PokemonNetworkProvider()
        let interactor = PokemonListInteractor(pokemonProvider: provider)
        
        view.presenter = presenter
        view.presenter.view = view
        view.presenter.entity = entity
        view.presenter.interactor = interactor
        view.presenter.interactor?.output = presenter
        view.presenter.wireframe = wireframe
        
        view.presenter.wireframe?.output = presenter
        view.presenter.wireframe?.view = view
        
        return view
    }
}
