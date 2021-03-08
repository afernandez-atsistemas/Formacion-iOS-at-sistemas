//
//  ViewController.swift
//  CursoiOS-Proyecto1
//
//  Created by Abrahán Fernández on 28/12/2020.
//

import UIKit

class ViewController: UITableViewController {

    let landmarks = landmarkData

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Tabla"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = landmarks[indexPath.row].name
        cell.imageView?.image = landmarks[indexPath.row].image

        return cell
    }
}



