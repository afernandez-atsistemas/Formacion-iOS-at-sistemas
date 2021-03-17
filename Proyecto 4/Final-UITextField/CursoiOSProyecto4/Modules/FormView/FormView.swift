//
//  FormView.swift
//  CursoiOSProyecto4
//
//  Created by Abrahán Fernández on 1/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class FormView: BaseViewController, FormViewContract {

	var presenter: FormPresenterContract!

    @IBOutlet weak var nametTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!

    @IBOutlet weak var sendButton: UIButton!

    // swiftlint:disable:next weak_delegate
    private var textFieldsDelegate: UITextFieldDelegate! = FormTextFieldDelegate()

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

    @IBAction func sendButtonAction(_ sender: UIButton) {
        presenter.sendAction()
    }

    private func setupView() {
        nametTextField.tag = 0
        nametTextField.delegate = textFieldsDelegate
        emailTextField.tag = 1
        emailTextField.delegate = textFieldsDelegate
        passwordTextField.tag = 2
        passwordTextField.delegate = textFieldsDelegate
        repeatPasswordTextField.tag = 3
        repeatPasswordTextField.delegate = textFieldsDelegate
    }
}

class FormTextFieldDelegate: NSObject, UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        if let nextTextField = textField.superview?.viewWithTag(nextTag) {
            nextTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }

        return true
    }
}
