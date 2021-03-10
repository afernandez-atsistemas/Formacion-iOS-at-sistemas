//
//  PokemonListTableViewCell.swift
//  CursoiOSProyecto3
//
//  Created by Abrahán Fernández on 2/2/21.
//

import UIKit
import SDWebImage

class PokemonListTableViewCell: UITableViewCell {

    static let cellId = "PokemonListTableViewCell"

    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var pokemonThumb: UIImageView!
    @IBOutlet weak var favButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setUpData(pokemon: Pokemon) {
        if let url = URL(string: pokemon.getImageThumb()) {
            pokemonThumb.sd_setImage(with: url, completed: nil)
        }

        displayNameLabel.text = pokemon.name
        favButton.isSelected = pokemon.fav
    }
    
    @IBAction func favButtonAction(_ sender: UIButton) {
    }
}
