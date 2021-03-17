//
//  PokemonListView.swift
//  CursoiOSProyecto3_Base
//
//  Created by Abrahán Fernández on 1/2/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class PokemonListView: BaseViewController, PokemonListViewContract {

	var presenter: PokemonListPresenterContract!

    @IBOutlet weak var tableView: UITableView!

    var datasource: PokemonListDataSource!
    // swiftlint:disable:next weak_delegate
    var delegate: PokemonListDelegate!

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

    // MARK: - Public methods
    func updatePokemonData(pokemons: [Pokemon]) {
        datasource.pokemons = pokemons

        tableView.reloadData()
    }

    func feedbackError(error: Error) {
        assert(false, "not implemented")
    }

    // MARK: - Private methods
    private func setupView() {
        // Associate xib table view cell with table view
        tableView.register(UINib(nibName: PokemonListTableViewCell.cellId, bundle: nil),
                           forCellReuseIdentifier: PokemonListTableViewCell.cellId)

        // Setup datasource & delegate
        datasource = PokemonListDataSource()
        delegate = PokemonListDelegate()
        delegate.presenter = presenter

        tableView.dataSource = datasource
        tableView.delegate = delegate
    }
}

class PokemonListDataSource: NSObject, UITableViewDataSource {
    var pokemons: [Pokemon] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonListTableViewCell.cellId,
                                                 // swiftlint:disable:next force_cast
                                                 for: indexPath) as! PokemonListTableViewCell
        cell.setUpData(pokemon: pokemons[indexPath.item])

        return cell
    }
}

class PokemonListDelegate: NSObject, UITableViewDelegate {

    weak var presenter: PokemonListPresenterContract!

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectPokemonCell(index: indexPath.item)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}
