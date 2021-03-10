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
    // MARK: Private attr
    private var dataSource: PokemonListDataSource!
    private var delegate: PokemonListDelegate!

    // MARK: Public attr
	var presenter: PokemonListPresenterContract!
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.presenter.viewDidLoad()
    }

    func updateData(pokemons: [Pokemon]) {
        dataSource.pokemons = pokemons
        tableView.reloadData()
    }

    func navigateTo(view: UIViewController) {
        self.present(view, animated: true, completion: nil)
    }

    // MARK: - Private methods
    private func setupView() {
        dataSource = PokemonListDataSource()
        delegate = PokemonListDelegate()
        delegate.presenter = presenter

        tableView.register(UINib(nibName: PokemonListTableViewCell.cellId, bundle: nil),
                           forCellReuseIdentifier: PokemonListTableViewCell.cellId)
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
}

// MARK: - PokemonList tableView datasource & delegate
class PokemonListDataSource: NSObject, UITableViewDataSource {
    var pokemons: [Pokemon] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemons.count
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
