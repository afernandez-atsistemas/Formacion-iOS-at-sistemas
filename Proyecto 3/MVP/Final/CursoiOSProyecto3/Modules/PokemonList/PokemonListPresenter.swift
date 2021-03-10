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

    weak var view: PokemonListViewContract?
    private var pokemonProvider: PokemonProviderContract!

    private var pokemons: [Pokemon] = []

    init(pokemonProvider: PokemonProviderContract) {
        self.pokemonProvider = pokemonProvider
    }

    func viewDidLoad() {

    }

    func viewWillAppear() {
        firstly {
            pokemonProvider.getPokemons()
        }.done { pokemons in
            self.pokemons = pokemons
            self.view?.updateData(pokemons: pokemons)
        }.catch { error in
            debugPrint(error)
        }
    }

    func selectPokemonCell(index: Int) {
        let pokemonSelected = pokemons[index]

        let viewDetail = PokemonDetailView.init(nibName: String(describing: PokemonDetailView.self),
                                                bundle: nil) as! PokemonDetailView
        let presenter = PokemonDetailPresenter()
        presenter.view = viewDetail
        presenter.pokemon = pokemonSelected
        viewDetail.presenter = presenter

        view?.navigateTo(view: viewDetail)
    }
}
