//
//  LoginBuilder.swift
//  CursoiOSProyecto4
//
//  Created by Abrahán Fernández on 3/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class LoginBuilder {

    static func build() -> LoginView {
        let view = LoginView.init(nibName: String(describing: LoginView.self), bundle: nil)
        view.tabBarItem = UITabBarItem(title: "Login",
                                       image: UIImage(systemName: "person.fill"), tag: 0)
        let presenter = LoginPresenter()
        let entity = LoginEntity()
        let wireframe = LoginWireframe()
        
        let provider = BiometricProvider()
        let interactor = LoginInteractor(biometricProvider: provider)
        
        view.presenter = presenter
        view.presenter.view = view
        view.presenter.entity = entity
        view.presenter.interactor = interactor
        view.presenter.interactor.output = presenter
        view.presenter.wireframe = wireframe
        
        view.presenter.wireframe.output = presenter
        view.presenter.wireframe.view = view
        
        return view
    }
}
