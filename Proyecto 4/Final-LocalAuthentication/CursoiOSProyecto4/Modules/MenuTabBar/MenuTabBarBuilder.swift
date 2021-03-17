//
//  MenuTabBarBuilder.swift
//  CursoiOSProyecto4
//
//  Created by Abrahán Fernández on 1/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class MenuTabBarBuilder {

    static func build() -> MenuTabBarView {
        let view = MenuTabBarView.init(nibName: String(describing: MenuTabBarView.self), bundle: nil)


        return view
    }

    static func setupPresenter(view: MenuTabBarViewContract) {
        let presenter = MenuTabBarPresenter()
        let entity = MenuTabBarEntity()
        let wireframe = MenuTabBarWireframe()

        let interactor = MenuTabBarInteractor()

        view.presenter = presenter
        view.presenter?.view = view
        view.presenter?.entity = entity
        view.presenter?.interactor = interactor
        view.presenter?.interactor.output = presenter
        view.presenter?.wireframe = wireframe

        view.presenter?.wireframe.output = presenter
        view.presenter?.wireframe.view = view
    }
}
