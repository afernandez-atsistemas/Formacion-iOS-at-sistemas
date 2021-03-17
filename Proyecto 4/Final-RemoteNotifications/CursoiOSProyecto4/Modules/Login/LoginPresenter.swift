//
//  LoginPresenter.swift
//  CursoiOSProyecto4
//
//  Created by Abrahán Fernández on 3/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import PromiseKit

class LoginPresenter: BasePresenter, LoginPresenterContract {

    weak var view: LoginViewContract!
    var interactor: LoginInteractorContract!
    var entity: LoginEntityContract!
    var wireframe: LoginWireframeContract!

    func viewWillAppear() {

    }
    
    func viewDidLoad() {
       
    }

    func loginAction() {
        /*firstly {
            interactor.tryBiometricLogin()
        }.done { result in
            if result {
                self.wireframe.showAlert(title: "Login success", subtitle: "Biometric works!")
            } else {
                self.wireframe.showAlert(title: "Login error", subtitle: "Biometric fail!")
            }
        }.catch { _ in
            self.wireframe.showAlert(title: "Login error", subtitle: "Biometric fail!")
        }*/
        interactor.authNotification()
    }
}

// MARK: - LoginInteractorOutputContract
extension LoginPresenter: LoginInteractorOutputContract {
    
}

// MARK: - LoginWireframeOutputContract
extension LoginPresenter: LoginWireframeOutputContract {
    
}
