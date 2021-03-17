//
//  LoginContract.swift
//  CursoiOSProyecto4
//
//  Created by Abrahán Fernández on 3/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit
import CoreBluetooth
import PromiseKit

protocol LoginEntityContract: BaseEntity {
    
}

protocol LoginViewContract: BaseViewController {
    var presenter: LoginPresenterContract! { get set }
}

protocol LoginPresenterContract: BasePresenter {
    var view: LoginViewContract! { get set }
    var interactor: LoginInteractorContract! { get set }
    var entity: LoginEntityContract! { get set }
    var wireframe: LoginWireframeContract! { get set }

    func viewDidLoad()
    func viewWillAppear()

    func loginAction()
}

protocol LoginInteractorContract: BaseInteractor {
    var output: LoginInteractorOutputContract! {get set}

    func tryBiometricLogin() -> Promise<Bool>
}

protocol LoginInteractorOutputContract: class {
    
}

protocol LoginWireframeContract: BaseWireframe {
    var output: LoginWireframeOutputContract! { get set }
    var view: UIViewController! { get set }
    
    func showBasicLoading(text: String)
    func hideBasicLoading(completion: @escaping (() -> Void))

    func showAlert(title: String, subtitle: String)
}

protocol LoginWireframeOutputContract: class {

}
