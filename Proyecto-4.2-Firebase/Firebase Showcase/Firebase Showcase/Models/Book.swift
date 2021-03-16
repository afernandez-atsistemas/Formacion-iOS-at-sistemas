//
//  Book.swift
//  Firebase Showcase
//
//  Created by Abrahán Fernández on 15/3/21.
//

import Foundation
import ObjectMapper

protocol BookModel {
    func getTitle() -> String
    func getAuthor() -> String
}

struct Book: ImmutableMappable, BookModel {
    private let title: String
    private let author: String

    init(map: Map) throws {
      title = try map.value("title")
      author = try map.value("author")
    }

    func mapping(map: Map) {
      title >>> map["title"]
      author >>> map["author"]
    }

    func getTitle() -> String {
        return title
    }

    func getAuthor() -> String {
        return author
    }
}
