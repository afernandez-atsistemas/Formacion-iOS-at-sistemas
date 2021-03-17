//
//  PokemonListPresenter.swift
//  CursoiOSProyecto3_Base
//
//  Created by Abrahán Fernández on 1/2/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import PromiseKit

class PokemonListPresenter: BasePresenter, PokemonListPresenterContract {

    weak var view: PokemonListViewContract!
    var interactor: PokemonListInteractorContract!
    var entity: PokemonListEntityContract?
    var wireframe: PokemonListWireframeContract?

    var pokemonsList: [Pokemon] = []

    func viewDidLoad() {

    }

    func viewWillAppear() {
        // get initial data to populate the view
        firstly {
            interactor.getPokemonsList()
        }.done { [weak self] pokemonsListData in
            self?.pokemonsList = pokemonsListData
            self?.view.updatePokemonData(pokemons: pokemonsListData)
        }.catch { error in
            self.view.feedbackError(error: error)
        }
    }

    func getTabBarItemTitle() -> String {
        return "Pokemon List"
    }

    func selectPokemonCell(index: Int) {
        if pokemonsList.count > index {
            let pokemon = pokemonsList[index]

            wireframe?.showDetailPokemonView(pokemon: pokemon)
        } else {
            debugPrint("Object at Index \(index) not found")
        }
    }
}

// MARK: - PokemonListInteractorOutputContract
extension PokemonListPresenter: PokemonListInteractorOutputContract {
    
}

// MARK: - PokemonListWireframeOutputContract
extension PokemonListPresenter: PokemonListWireframeOutputContract {
    
}
