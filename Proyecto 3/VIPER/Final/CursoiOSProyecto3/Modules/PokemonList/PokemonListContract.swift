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
import CoreBluetooth
import PromiseKit

protocol PokemonListEntityContract: BaseEntity {
    
}

protocol PokemonListViewContract: BaseViewController {
    var presenter: PokemonListPresenterContract! { get set }

    func updatePokemonData(pokemons: [Pokemon])
    func feedbackError(error: Error)
}

protocol PokemonListPresenterContract: BasePresenter {
    var view: PokemonListViewContract! { get set }
    var interactor: PokemonListInteractorContract! { get set }
    var entity: PokemonListEntityContract? { get set }
    var wireframe: PokemonListWireframeContract? { get set }
    
    func viewWillAppear()
    func viewDidLoad()

    func selectPokemonCell(index: Int)
}

protocol PokemonListInteractorContract: BaseInteractor {
    var output: PokemonListInteractorOutputContract? {get set}

    func getPokemonsList() -> Promise<[Pokemon]>
}

protocol PokemonListInteractorOutputContract: class {
    
}

protocol PokemonListWireframeContract: BaseWireframe {
    var output: PokemonListWireframeOutputContract? { get set }
    var view: UIViewController? { get set }
    
    func showBasicLoading(text: String)
    func hideBasicLoading(completion: @escaping (() -> Void))
    func showDetailPokemonView(pokemon: Pokemon)
}

protocol PokemonListWireframeOutputContract: class {

}
