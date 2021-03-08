//
//  TableViewController.swift
//  CursoiOS-Proyecto2
//
//  Created by Abrahán Fernández on 08/01/2021.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        tableView.register(UINib(nibName: TableViewCell.viewIdentifier, bundle: nil),
                           forCellReuseIdentifier: TableViewCell.viewIdentifier)
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.viewIdentifier,
                                                 for: indexPath)

        return cell
    }

}

