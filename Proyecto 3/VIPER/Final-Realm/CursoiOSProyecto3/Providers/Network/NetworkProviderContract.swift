//
//  NetworkProviderContract.swift
//  CursoiOSProyecto3
//
//  Created by Abrahán Fernández on 10/3/21.
//

import Foundation
import PromiseKit

protocol PokemonProviderContract {
    func getPokemons() -> Promise<[PokemonDAO]>
}
