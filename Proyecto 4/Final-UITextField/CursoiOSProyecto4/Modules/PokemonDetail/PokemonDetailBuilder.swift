//
//  PokemonDetailBuilder.swift
//  CursoiOSProyecto3
//
//  Created by Abrahán Fernández on 8/2/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class PokemonDetailBuilder {

    static func build(pokemon: Pokemon) -> PokemonDetailView {
        let view = PokemonDetailView.init(nibName: String(describing: PokemonDetailView.self), bundle: nil)
        let presenter = PokemonDetailPresenter()
        let entity = PokemonDetailEntity()
        let wireframe = PokemonDetailWireframe()
        
        let provider = PokemonNetworkProvider()
        let interactor = PokemonDetailInteractor(provider: provider, pokemon: pokemon)
        
        view.presenter = presenter
        view.presenter.view = view
        view.presenter.entity = entity
        view.presenter.interactor = interactor
        view.presenter.interactor.output = presenter
        view.presenter.wireframe = wireframe
        
        view.presenter.wireframe.output = presenter
        view.presenter.wireframe.view = view
        
        return view
    }
}
