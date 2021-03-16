//
//  BookListContract.swift
//  Firebase Showcase
//
//  Created by Abrahán Fernández on 15/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit
import PromiseKit

protocol BookListEntityContract: BaseEntity {
    
}

protocol BookListViewContract: BaseViewController {
    var presenter: BookListPresenterContract! { get set }
    
}

protocol BookListPresenterContract: BasePresenter {
    var view: BookListViewContract! { get set }
    var interactor: BookListInteractorContract! { get set }
    var entity: BookListEntityContract! { get set }
    var wireframe: BookListWireframeContract! { get set }

    func viewDidLoad()
    func viewWillAppear()
}

protocol BookListInteractorContract: BaseInteractor {
    var output: BookListInteractorOutputContract! {get set}

    func getBooks() -> Promise<[BookModel]>
}

protocol BookListInteractorOutputContract: class {
    
}

protocol BookListWireframeContract: BaseWireframe {
    var output: BookListWireframeOutputContract! { get set }
    var view: UIViewController! { get set }
    
    func showBasicLoading(text: String)
    func hideBasicLoading(completion: @escaping (() -> Void))
}

protocol BookListWireframeOutputContract: class {

}
