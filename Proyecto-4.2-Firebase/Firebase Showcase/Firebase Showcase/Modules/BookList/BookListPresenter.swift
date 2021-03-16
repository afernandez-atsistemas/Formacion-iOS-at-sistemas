//
//  BookListPresenter.swift
//  Firebase Showcase
//
//  Created by Abrahán Fernández on 15/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import PromiseKit

class BookListPresenter: BasePresenter, BookListPresenterContract {

    weak var view: BookListViewContract!
    var interactor: BookListInteractorContract!
    var entity: BookListEntityContract!
    var wireframe: BookListWireframeContract!

    func viewDidLoad() {

    }

    func viewWillAppear() {
        firstly {
          interactor.getBooks()
        }.done { books in
            debugPrint("Books: \(books)")
        }
    }
}


// MARK: - BookListInteractorOutputContract
extension BookListPresenter: BookListInteractorOutputContract {
    
}

// MARK: - BookListWireframeOutputContract
extension BookListPresenter: BookListWireframeOutputContract {
    
}
