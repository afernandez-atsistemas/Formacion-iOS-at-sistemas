//
//  PokemonDetailPresenter.swift
//  CursoiOSProyecto3
//
//  Created by Abrahán Fernández on 21/2/21.
//

import Foundation

class PokemonDetailPresenter: BasePresenter, PokemonDetailPresenterContract {

    weak var view: PokemonDetailViewContract?
    var pokemon: Pokemon!

    func viewDidLoad() {

    }

    func viewWillAppear() {
        view?.reloadViewWithData(pokemon: pokemon)
    }
}
