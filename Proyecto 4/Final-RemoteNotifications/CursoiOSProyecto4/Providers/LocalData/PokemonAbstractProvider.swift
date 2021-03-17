//
//  PokemonAbstractProvider.swift
//  CursoiOSProyecto4
//
//  Created by Abrahán Fernández on 22/2/21.
//

import Foundation
import PromiseKit

protocol PokemonAbstractProviderContract {
    func getAbstractInfo() -> Promise<String>
}

class PokemonAbstractProvider: PokemonAbstractProviderContract {

    enum Failure: Error {
        case localFileNotFound
    }

    func getAbstractInfo() -> Promise<String> {
        return Promise<String> { promise in
            if let filepath = Bundle.main.path(forResource: "html-attr-string", ofType: "html") {
                do {
                    let contents = try String(contentsOfFile: filepath)
                    promise.fulfill(contents)
                } catch {
                    promise.reject(error)
                }
            } else {
                promise.reject(Failure.localFileNotFound)
            }
        }
    }
}
