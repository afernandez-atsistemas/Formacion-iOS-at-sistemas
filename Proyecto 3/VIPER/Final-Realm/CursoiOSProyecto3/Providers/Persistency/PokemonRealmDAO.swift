//
//  PokemonRealmDAO.swift
//  CursoiOSProyecto3
//
//  Created by Abrahán Fernández on 10/3/21.
//

import Foundation
import RealmSwift

class PokemonRealmDAO: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var fav: Bool = false

    init(pokemon: Pokemon) {
        self.name = pokemon.name
        self.fav = pokemon.fav
    }
}
