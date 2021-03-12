//
//  PokemonDataTableViewCell.swift
//  CursoiOSProyecto3
//
//  Created by Abrahán Fernández on 8/2/21.
//

import UIKit

class PokemonDataTableViewCell: UITableViewCell {

    static let cellId = "PokemonDataTableViewCell"

    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(title: String, value: String) {
        primaryLabel.text = title
        secondaryLabel.text = value
    }
}
