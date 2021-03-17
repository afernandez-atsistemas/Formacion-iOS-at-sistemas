//
//  FormContract.swift
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

protocol FormEntityContract: BaseEntity {
    
}

protocol FormViewContract: BaseViewController {
    var presenter: FormPresenterContract! { get set }
    
}

enum FieldType {
    case alpha, num, password
}

protocol FormPresenterContract: BasePresenter {
    var view: FormViewContract! { get set }
    var interactor: FormInteractorContract! { get set }
    var entity: FormEntityContract! { get set }
    var wireframe: FormWireframeContract! { get set }

    func viewDidLoad()
    func viewWillAppear()

    func sendAction()
}

protocol FormInteractorContract: BaseInteractor {
    var output: FormInteractorOutputContract! {get set}

    init(loginProvider: LoginProviderContract)

    func sendLoginData(username: String, email: String, password: String) -> Promise<Void>
}

protocol FormInteractorOutputContract: class {
    
}

protocol FormWireframeContract: BaseWireframe {
    var output: FormWireframeOutputContract! { get set }
    var view: UIViewController! { get set }
    
    func showBasicLoading(text: String)
    func hideBasicLoading(completion: @escaping (() -> Void))
}

protocol FormWireframeOutputContract: class {

}
