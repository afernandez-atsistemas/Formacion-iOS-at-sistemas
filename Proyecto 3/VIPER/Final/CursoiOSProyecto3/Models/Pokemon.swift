//
//  Pokemon.swift
//  CursoiOSProyecto3_Base
//
//  Created by Abrahán Fernández on 1/2/21.
//

import Foundation

struct Pokemon {
    var imageThumb: String
    var name: String
    var fav: Bool = false
    var height: Double
    var weight: Double
    var types: [String]

    init(pokemonDAO: PokemonDAO) {
        name = pokemonDAO.name
        if !pokemonDAO.imagesURL.isEmpty,
           let defaultFront = pokemonDAO.imagesURL[PokemonDAO.defaultFront] as? String {
            imageThumb = defaultFront
        } else {
            imageThumb = ""
        }
        height = pokemonDAO.height
        weight = pokemonDAO.weight
        let typesString = pokemonDAO.types.map { element -> String? in
            if let type = element["type"] as? [String: String],
               let nameType = type["name"] {
                return nameType
            } else {
                return nil
            }
        }

        types = typesString.compactMap { $0 }
    }
}
