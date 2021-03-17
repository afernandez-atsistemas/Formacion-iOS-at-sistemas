//
//  FormBuilder.swift
//  CursoiOSProyecto4
//
//  Created by Abrahán Fernández on 1/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class FormBuilder {

    static func build() -> FormView {
        let view = FormView.init(nibName: String(describing: FormView.self), bundle: nil)
        view.tabBarItem = UITabBarItem(title: "Form view",
                                       image: UIImage(systemName: "square.and.pencil"), tag: 0)
        let presenter = FormPresenter()
        let entity = FormEntity()
        let wireframe = FormWireframe()
        
        let provider = HttpbinNetworkProvider()
        let interactor = FormInteractor(loginProvider: provider)
        
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
