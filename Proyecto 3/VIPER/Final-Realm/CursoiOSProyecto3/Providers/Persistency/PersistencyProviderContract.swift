//
//  PersistencyProviderContract.swift
//  CursoiOSProyecto3
//
//  Created by Abrahán Fernández on 10/3/21.
//

import Foundation
import PromiseKit

protocol PersistencyProviderContract {
    func savePokemon(pokemon: Pokemon) -> Promise<Void>
    func getPokemonsFromPersistency() -> Promise<[Pokemon]>
}

enum PersistencyError: Error {
    case databaseError
}
