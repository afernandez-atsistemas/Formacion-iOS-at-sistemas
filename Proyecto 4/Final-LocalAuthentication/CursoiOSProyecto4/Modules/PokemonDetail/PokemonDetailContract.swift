//
//  PokemonDetailContract.swift
//  CursoiOSProyecto3
//
//  Created by Abrahán Fernández on 8/2/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit
import CoreBluetooth
import PromiseKit

protocol PokemonDetailEntityContract: BaseEntity {
    
}

protocol PokemonDetailViewContract: BaseViewController {
    var presenter: PokemonDetailPresenterContract! { get set }

    func reloadViewWithData(pokemon: Pokemon)
}

protocol PokemonDetailPresenterContract: BasePresenter {
    var view: PokemonDetailViewContract! { get set }
    var interactor: PokemonDetailInteractorContract! { get set }
    var entity: PokemonDetailEntityContract! { get set }
    var wireframe: PokemonDetailWireframeContract! { get set }
    
    func viewWillAppear()
    func viewDidLoad()

    func headerButtonTouch()
}

protocol PokemonDetailInteractorContract: BaseInteractor {
    var output: PokemonDetailInteractorOutputContract! {get set}

    func getPokemonData() -> Pokemon
}

protocol PokemonDetailInteractorOutputContract: class {
    
}

protocol PokemonDetailWireframeContract: BaseWireframe {
    var output: PokemonDetailWireframeOutputContract! { get set }
    var view: UIViewController! { get set }
    
    func showBasicLoading(text: String)
    func hideBasicLoading(completion: @escaping (() -> Void))
    func navigateToAbstract()
}

protocol PokemonDetailWireframeOutputContract: class {
}
