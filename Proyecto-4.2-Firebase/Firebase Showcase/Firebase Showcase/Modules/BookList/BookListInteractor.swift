//
//  BookListInteractor.swift
//  Firebase Showcase
//
//  Created by Abrahán Fernández on 15/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import PromiseKit

class BookListInteractor: BaseInteractor, BookListInteractorContract {
    weak var output: BookListInteractorOutputContract!

    var bookProvider: BookProviderContract
    
    init (bookProvider: BookProviderContract) {
        self.bookProvider = bookProvider
    }

    func getBooks() -> Promise<[BookModel]> {
        return bookProvider.getBooks()
    }
}

