//
//  PokemonListContract.swift
//  CursoiOSProyecto3_Base
//
//  Created by Abrahán Fernández on 1/2/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit

protocol PokemonListViewContract: BaseViewController {
    var presenter: PokemonListPresenterContract! { get set }

    func updateData(pokemons: [Pokemon])
    func navigateTo(view: UIViewController)
}

protocol PokemonListPresenterContract: BasePresenter {
    var view: PokemonListViewContract? { get set }

    func viewDidLoad()
    func viewWillAppear()

    func selectPokemonCell(index: Int)
}
