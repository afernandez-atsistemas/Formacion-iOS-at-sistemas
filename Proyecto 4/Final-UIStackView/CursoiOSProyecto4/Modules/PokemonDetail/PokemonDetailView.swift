//
//  PokemonDetailView.swift
//  CursoiOSProyecto3
//
//  Created by Abrahán Fernández on 8/2/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class PokemonDetailView: BaseViewController, PokemonDetailViewContract {

	var presenter: PokemonDetailPresenterContract!

    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var headerButton: UIButton!

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear()
    }

    func setupView() {
        headerImage.makeRounded()
    }

    func reloadViewWithData(pokemon: Pokemon) {
        headerImage.sd_setImage(with: URL(string: pokemon.imageThumb)!, completed: nil)

        removeOldDataFromStack()
        populateStackView(data: genericData(pokemon: pokemon))
    }

    // MARK: - IBActions
    @IBAction func headerButtonAction(_ sender: UIButton) {
        presenter.headerButtonTouch()
    }

    // MARK: - Private methods
    private func genericData(pokemon: Pokemon) -> [String: String] {
        var pokemonData: [String: String] = [:]

        pokemonData["name"] = pokemon.name
        pokemonData["heigth"] = "\(pokemon.height)"
        pokemonData["weight"] = "\(pokemon.weight)"
        pokemonData["types"] = pokemon.types.joined(separator: ", ")

        return pokemonData
    }

    private func removeOldDataFromStack() {
        for v in stackView.arrangedSubviews {
            stackView.removeArrangedSubview(v)
            v.removeFromSuperview()
        }
    }

    private func populateStackView(data: [String: String]) {
        for (key, value) in data {
            let stack = UIStackView()
            let titleLabel = UILabel()
            titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
            titleLabel.text = key

            let valueLabel = UILabel()
            valueLabel.font = UIFont.preferredFont(forTextStyle: .body)
            valueLabel.text = value



            stack.axis = .horizontal
            stack.distribution = .equalCentering
            stack.addArrangedSubview(titleLabel)
            stack.addArrangedSubview(valueLabel)
            stackView.addArrangedSubview(stack)
        }

    }
}
