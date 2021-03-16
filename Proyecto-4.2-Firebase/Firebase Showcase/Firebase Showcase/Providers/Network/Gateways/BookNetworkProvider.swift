//
//  PokemonProvider.swift
//  CursoiOSProyecto3_Base
//
//  Created by Abrahán Fernández on 1/2/21.
//

import Foundation
import PromiseKit
import FirebaseFirestore

protocol BookProviderContract {
    func getBooks() -> Promise<[BookModel]>
}

class BookNetworkProvider: BookProviderContract {
    enum BookNetworkError: Error {
        case initialPageLoadError, detailPageLoadError
    }

    private let kBooksCollectionKey = "libros"

    func getBooks() -> Promise<[BookModel]> {
        return Promise<[BookModel]> { promise in
            var books: [BookModel] = []
            Firestore.firestore().collection(kBooksCollectionKey).getDocuments { querySnapshot, error in
                if let documents = querySnapshot?.documents {
                    for doc in documents {
                        do {
                            let book = try Book(JSON: doc.data())
                            books.append(book)
                        } catch {
                        }
                    }
                }
                promise.fulfill(books)
            }
        }
    }

}
