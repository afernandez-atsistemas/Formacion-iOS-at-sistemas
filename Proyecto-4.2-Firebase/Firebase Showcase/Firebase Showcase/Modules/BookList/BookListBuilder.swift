//
//  BookListBuilder.swift
//  Firebase Showcase
//
//  Created by Abrahán Fernández on 15/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class BookListBuilder {

    static func build() -> BookListView {
        let view = BookListView.init(nibName: String(describing: BookListView.self), bundle: nil)
        let presenter = BookListPresenter()
        let entity = BookListEntity()
        let wireframe = BookListWireframe()
        
        let provider = BookNetworkProvider()
        let interactor = BookListInteractor(bookProvider: provider)
        
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
