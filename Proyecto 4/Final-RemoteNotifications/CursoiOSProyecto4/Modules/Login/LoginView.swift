//
//  LoginView.swift
//  CursoiOSProyecto4
//
//  Created by Abrahán Fernández on 3/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class LoginView: BaseViewController, LoginViewContract {
	var presenter: LoginPresenterContract!

    @IBOutlet weak var loginButton: UIButton!
    
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

    @IBAction func loginButtonAction(_ sender: Any) {
        presenter.loginAction()
    }
}
