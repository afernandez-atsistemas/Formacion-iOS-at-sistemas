//
//  PokemonAbstractContract.swift
//  CursoiOSProyecto4
//
//  Created by Abrahán Fernández on 22/2/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit
import CoreBluetooth
import PromiseKit

protocol PokemonAbstractEntityContract: BaseEntity {
    
}

protocol PokemonAbstractViewContract: BaseViewController {
    var presenter: PokemonAbstractPresenterContract! { get set }

    func updateAbstract(html: NSAttributedString)
    
}

protocol PokemonAbstractPresenterContract: BasePresenter {
    var view: PokemonAbstractViewContract! { get set }
    var interactor: PokemonAbstractInteractorContract! { get set }
    var entity: PokemonAbstractEntityContract! { get set }
    var wireframe: PokemonAbstractWireframeContract! { get set }

    func viewDidLoad()
    func viewWillAppear()
}

protocol PokemonAbstractInteractorContract: BaseInteractor {
    var output: PokemonAbstractInteractorOutputContract! {get set}

    func getAbstract() -> Promise<NSAttributedString>
}

protocol PokemonAbstractInteractorOutputContract: class {
    
}

protocol PokemonAbstractWireframeContract: BaseWireframe {
    var output: PokemonAbstractWireframeOutputContract! { get set }
    var view: UIViewController! { get set }
    
    func showBasicLoading(text: String)
    func hideBasicLoading(completion: @escaping (() -> Void))
}

protocol PokemonAbstractWireframeOutputContract: class {

}
