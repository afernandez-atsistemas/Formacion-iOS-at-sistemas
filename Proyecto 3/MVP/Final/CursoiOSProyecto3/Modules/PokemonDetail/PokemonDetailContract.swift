//
//  PokemonDetailContract.swift
//  CursoiOSProyecto3
//
//  Created by Abrahán Fernández on 21/2/21.
//

import Foundation
import UIKit

protocol PokemonDetailViewContract: BaseViewController {
    var presenter: PokemonDetailPresenterContract! { get set }

    func reloadViewWithData(pokemon: Pokemon)
}

protocol PokemonDetailPresenterContract: BasePresenter {
    var view: PokemonDetailViewContract? { get set }
    var pokemon: Pokemon! { get set }

    func viewDidLoad()
    func viewWillAppear()
}
