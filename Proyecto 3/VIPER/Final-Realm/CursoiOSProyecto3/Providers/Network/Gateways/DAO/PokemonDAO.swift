//
//  PokemonDAO.swift
//  CursoiOSProyecto3
//
//  Created by Abrahán Fernández on 5/2/21.
//

import Foundation
import ObjectMapper

struct PokemonDAO: ImmutableMappable {

    static let defaultFront = "front_default"

    let id: IntegerLiteralType
    let name: String
    let imagesURL: [String: Any]
    let height: Double
    let weight: Double
    let types: [[String: Any]]

    init(map: Map) throws {
        id = try map.value("id")
        name = try map.value("name")
        imagesURL = try map.value("sprites")
        height = try map.value("height")
        weight = try map.value("weight")
        types = try map.value("types")
    }

    func mapping(map: Map) {
        id   >>> map["id"]
        name >>> map["name"]
        imagesURL >>> map["sprites"]
        height >>> map["height"]
        weight >>> map["width"]
        types >>> map["types"]
    }
}
