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
    @IBOutlet weak var tableView: UITableView!

    var datasource: PokemonDetailDataSource!
    // swiftlint:disable:next weak_delegate
    var delegate: PokemonDetailDelegate!

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

        // Setup tableview
        tableView.register(UINib(nibName: PokemonDataTableViewCell.cellId, bundle: nil),
                           forCellReuseIdentifier: PokemonDataTableViewCell.cellId)
        datasource = PokemonDetailDataSource()
        delegate = PokemonDetailDelegate()
        tableView.dataSource = datasource
        tableView.delegate = delegate
        tableView.allowsSelection = false
    }

    func reloadViewWithData(pokemon: Pokemon) {
        headerImage.sd_setImage(with: URL(string: pokemon.imageThumb)!, completed: nil)

        datasource.pokemonData = genericData(pokemon: pokemon)
        tableView.reloadData()
    }

    private func genericData(pokemon: Pokemon) -> [String: String] {
        var pokemonData: [String: String] = [:]

        pokemonData["name"] = pokemon.name
        pokemonData["heigth"] = "\(pokemon.height)"
        pokemonData["weight"] = "\(pokemon.weight)"
        pokemonData["types"] = pokemon.types.joined(separator: ", ")

        return pokemonData
    }
}

class PokemonDetailDataSource: NSObject, UITableViewDataSource {
    var pokemonData: [String: String]!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonDataTableViewCell.cellId,
                                                 // swiftlint:disable:next force_cast
                                                 for: indexPath) as! PokemonDataTableViewCell

        cell.setData(title: Array(pokemonData.keys)[indexPath.item],
                     value: Array(pokemonData.values)[indexPath.item])

        return cell
    }

}

class PokemonDetailDelegate: NSObject, UITableViewDelegate {

}
