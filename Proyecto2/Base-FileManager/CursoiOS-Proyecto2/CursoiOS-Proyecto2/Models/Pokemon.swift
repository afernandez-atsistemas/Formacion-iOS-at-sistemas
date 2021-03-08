//
//  Pokemon.swift
//  CursoiOS-Proyecto2
//
//  Created by Abrahán Fernández on 12/01/2021.
//

import Foundation

struct Pokemon: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let locationArea: String

    struct PokemonSprites: Decodable {
        let front_default: String?
        let front_shiny: String?
        let front_female: String?
        let front_shiny_female: String?

        let back_default: String?
        let back_shiny: String?
        let back_female: String?
        let back_shiny_female: String?
    }

    let sprites: PokemonSprites

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case height
        case weight
        case locationArea = "location_area_encounters"
        case sprites
    }
}
