//
//  TableViewController.swift
//  CursoiOS-Proyecto2
//
//  Created by Abrahán Fernández on 08/01/2021.
//

import UIKit
import Alamofire

class TableViewController: UITableViewController {

    var pokemonsToShow: [Pokemon] = []
    var favsPokemons: [Int] = []
    var shinyPokemons: [Int: String] = [:]

    let userDefaults = UserDefaults.standard
    let userDefaultsFavKey = "FAV_POKEMONS"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        tableView.register(UINib(nibName: TableViewCell.viewIdentifier, bundle: nil),
                           forCellReuseIdentifier: TableViewCell.viewIdentifier)
        tableView.estimatedRowHeight = 75.0
        tableView.rowHeight = 75.0

        // Load local shiny images
        let fileManager = FileManager.default
        let pathResources = Bundle.main.resourcePath!

        let content = try! fileManager.contentsOfDirectory(atPath: pathResources)
        for item in content {
            if item.hasSuffix(".png") {
                let id = getIdFromFileName(name: item)

                shinyPokemons[id] = item
            }
        }

        loadPokemonInfo()
    }

    private func loadPokemonInfo() {
        AF.request("https://pokeapi.co/api/v2/pokemon/").responseJSON { response in
            print("Response de: ", response.result)
            guard let responseData = try? response.result.get() as? [String: Any],
                  let results = responseData["results"] as? [[String: String]] else {
                print("BAD RESPONSE DATA")
                return
            }
            let requestDispatchGroup = DispatchGroup()
            var allRequestResponse = [Pokemon]()

            for i in results {
                requestDispatchGroup.enter()
                AF.request(i["url"]!).responseDecodable(of: Pokemon.self) { response in
                    if let model = response.value {
                        allRequestResponse.append(model)
                    }
                    requestDispatchGroup.leave()
                }
            }

            requestDispatchGroup.notify(queue: .main) {
                self.requestDataComplete(data: allRequestResponse)
            }
        }
    }

    private func requestDataComplete(data: [Pokemon]) {
        if let favs = userDefaults.array(forKey: userDefaultsFavKey) as? [Int] {
            favsPokemons = favs
        }
        pokemonsToShow = data
        tableView.reloadData()
    }

    private func getIdFromFileName(name: String) -> Int {
        let range = NSRange(location: 0, length: name.utf16.count)
        let regex = try! NSRegularExpression(pattern: "(\\d+)-shiny.png")
        let regexResult = regex.matches(in: name, options: [], range: range)
        // Conversion from NSRange to Range
        let rangeSwiftString = Range(regexResult[0].range(at: 1), in: name)!
        let idFromFileName = name[rangeSwiftString]

        return Int(idFromFileName)!
    }

    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonsToShow.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.viewIdentifier,
                                                 for: indexPath) as! TableViewCell
        let pokemon = pokemonsToShow[indexPath.row]
        cell.configureCell(pokemon: pokemon)
        cell.favoritesDelegate = self
        if favsPokemons.contains(pokemon.id) {
            cell.markAsFavorite()
        }

        if let shinyImage = shinyPokemons[pokemon.id] {
            cell.setImage(image: UIImage(contentsOfFile: Bundle.main.resourcePath! + "/" + shinyImage)!)
        }

        return cell
    }
}

protocol FavoritesDelegate: class {
    func markPokemonAsFavOrUnmark(pokemonId: Int)
}

extension TableViewController: FavoritesDelegate {
    func markPokemonAsFavOrUnmark(pokemonId: Int) {
        let index = pokemonsToShow.firstIndex { $0.id == pokemonId }
        if index != nil {
            if favsPokemons.contains(pokemonId) {
                favsPokemons.removeAll { $0 == pokemonId }
            } else {
                favsPokemons.append(pokemonId)
            }

            userDefaults.set(favsPokemons, forKey: userDefaultsFavKey)
        }
    }
}

