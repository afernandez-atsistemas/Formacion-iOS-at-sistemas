//
//  MenuTabBarContract.swift
//  CursoiOSProyecto4
//
//  Created by Abrahán Fernández on 1/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit
import CoreBluetooth
import PromiseKit

protocol MenuTabBarEntityContract: BaseEntity {
    
}

protocol MenuTabBarViewContract: BaseTabBarController {
    var presenter: MenuTabBarPresenterContract? { get set }
    
}

protocol MenuTabBarPresenterContract: BasePresenter {
    var view: MenuTabBarViewContract! { get set }
    var interactor: MenuTabBarInteractorContract! { get set }
    var entity: MenuTabBarEntityContract! { get set }
    var wireframe: MenuTabBarWireframeContract! { get set }
    
    func viewWillAppear()
    func viewDidLoad()

    func getTabBarViewController() -> [BaseViewController]
}

protocol MenuTabBarInteractorContract: BaseInteractor {
    var output: MenuTabBarInteractorOutputContract! {get set}
}

protocol MenuTabBarInteractorOutputContract: class {
    
}

protocol MenuTabBarWireframeContract: BaseWireframe {
    var output: MenuTabBarWireframeOutputContract! { get set }
    var view: UIViewController! { get set }
    
    func showBasicLoading(text: String)
    func hideBasicLoading(completion: @escaping (() -> Void))
}

protocol MenuTabBarWireframeOutputContract: class {

}
