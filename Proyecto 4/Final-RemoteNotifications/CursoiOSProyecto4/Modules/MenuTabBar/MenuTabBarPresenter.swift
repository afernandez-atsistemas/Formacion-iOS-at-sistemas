//
//  MenuTabBarPresenter.swift
//  CursoiOSProyecto4
//
//  Created by Abrahán Fernández on 1/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

class MenuTabBarPresenter: BasePresenter, MenuTabBarPresenterContract {

    weak var view: MenuTabBarViewContract!
    var interactor: MenuTabBarInteractorContract!
    var entity: MenuTabBarEntityContract!
    var wireframe: MenuTabBarWireframeContract!

    func viewWillAppear() {

    }
    
    func viewDidLoad() {
       
    }

    func getTabBarViewController() -> [BaseViewController] {
        let pokemonList = PokemonListBuilder.build()
        let formsView = FormBuilder.build()
        let loginView = LoginBuilder.build()

        return [pokemonList, formsView, loginView]
    }
}

// MARK: - MenuTabBarInteractorOutputContract
extension MenuTabBarPresenter: MenuTabBarInteractorOutputContract {
    
}

// MARK: - MenuTabBarWireframeOutputContract
extension MenuTabBarPresenter: MenuTabBarWireframeOutputContract {
    
}
