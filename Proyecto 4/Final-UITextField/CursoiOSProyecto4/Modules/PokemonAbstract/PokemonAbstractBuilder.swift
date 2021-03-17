//
//  PokemonAbstractBuilder.swift
//  CursoiOSProyecto4
//
//  Created by Abrahán Fernández on 22/2/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class PokemonAbstractBuilder {

    static func build() -> PokemonAbstractView {
        let view = PokemonAbstractView.init(nibName: String(describing: PokemonAbstractView.self), bundle: nil)
        let presenter = PokemonAbstractPresenter()
        let entity = PokemonAbstractEntity()
        let wireframe = PokemonAbstractWireframe()
        
        let provider = PokemonAbstractProvider()
        let interactor = PokemonAbstractInteractor(provider: provider)
        
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
