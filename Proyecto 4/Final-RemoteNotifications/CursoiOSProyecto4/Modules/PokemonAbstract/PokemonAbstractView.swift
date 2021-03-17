//
//  PokemonAbstractView.swift
//  CursoiOSProyecto4
//
//  Created by Abrahán Fernández on 22/2/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class PokemonAbstractView: BaseViewController, PokemonAbstractViewContract {

	var presenter: PokemonAbstractPresenterContract!

    @IBOutlet weak var htmlLabel: UILabel!
    
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

    }

    func updateAbstract(html: NSAttributedString) {
        htmlLabel.attributedText = html
    }
}
