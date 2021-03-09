//
//  PokemonListPresenter.swift
//  CursoiOSProyecto3_Base
//
//  Created by Abrahán Fernández on 1/2/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

class PokemonListPresenter: BasePresenter, PokemonListPresenterContract {

    weak var view: PokemonListViewContract?
    var interactor: PokemonListInteractorContract?
    var entity: PokemonListEntityContract?
    var wireframe: PokemonListWireframeContract?

    func viewWillAppear() {

    }
    
    func viewDidLoad() {
       
    }

}

// MARK: - PokemonListInteractorOutputContract
extension PokemonListPresenter: PokemonListInteractorOutputContract {
    
}

// MARK: - PokemonListWireframeOutputContract
extension PokemonListPresenter: PokemonListWireframeOutputContract {
    
}
