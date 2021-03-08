//
//  TableViewCell.swift
//  CursoiOS-Proyecto2
//
//  Created by Abrahán Fernández on 08/01/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let viewIdentifier = "TableViewCell"

    weak var favoritesDelegate: FavoritesDelegate?
    var pokemonId: Int!

    @IBOutlet weak var favButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(pokemon: Pokemon) {
        pokemonId = pokemon.id

        self.textLabel?.text = pokemon.name
        if let frontDefault = pokemon.sprites.front_default {
            let url = URL(string: frontDefault)!
            
            self.imageView?.image = UIImage(data: try! Data(contentsOf: url))
        }
        // Always set to default value favButton
        favButton.isSelected = false
    }

    func markAsFavorite() {
        favButton.isSelected = true
    }

    @IBAction func favButtonAction(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }

        // Call delegate to update favorites array
        favoritesDelegate?.markPokemonAsFavOrUnmark(pokemonId: pokemonId)
    }
}
