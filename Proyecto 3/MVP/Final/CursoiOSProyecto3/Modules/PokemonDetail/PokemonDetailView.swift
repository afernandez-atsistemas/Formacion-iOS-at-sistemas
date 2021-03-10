//
//  PokemonDetailView.swift
//  CursoiOSProyecto3
//
//  Created by Abrahán Fernández on 21/2/21.
//

import UIKit

class PokemonDetailView: BaseViewController, PokemonDetailViewContract {

    // MARK: - Public attr
    var presenter: PokemonDetailPresenterContract!

    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Private attr
    private var dataSource: PokemonDetailDataSource!
    // swiftlint:disable:next weak_delegate
    private var delegate: PokemonDetailDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
        setUpView()
    }

    private func setupView() {

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        presenter.viewWillAppear()
    }

    func reloadViewWithData(pokemon: Pokemon) {
        imageView.sd_setImage(with: URL(string: pokemon.getImageThumb())!, completed: nil)
        dataSource.pokemonData = genericData(pokemon: pokemon)
        tableView.reloadData()
    }

    private func genericData(pokemon: Pokemon) -> [String: String] {
        var pokemonData: [String: String] = [:]

        pokemonData["name"] = pokemon.name
        pokemonData["heigth"] = "\(pokemon.height)"
        pokemonData["weight"] = "\(pokemon.weight)"

        var typesResults: [String] = []
        for dictionary in pokemon.types {
            if let typeDict = dictionary["type"] as? [String: Any],
               let name = typeDict["name"] as? String {
                typesResults.append(name)
            }
        }
        pokemonData["types"] = typesResults.joined(separator: ", ")

        return pokemonData
    }

    // MARK: - Private methods
    private func setUpView() {

        dataSource = PokemonDetailDataSource()
        delegate = PokemonDetailDelegate()
        tableView.register(UINib(nibName: PokemonDataTableViewCell.cellId, bundle: nil),
                           forCellReuseIdentifier: PokemonDataTableViewCell.cellId)

        tableView.dataSource = dataSource
        tableView.delegate = delegate
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
        let keysSorted = pokemonData.keys.sorted()
        let keyForIndex = keysSorted[indexPath.row]

        cell.setData(title: keyForIndex,
                     value: pokemonData[keyForIndex] ?? "Undefine")

        return cell
    }

}

class PokemonDetailDelegate: NSObject, UITableViewDelegate {

}

