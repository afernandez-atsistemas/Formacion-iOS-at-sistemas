//
//  FormInteractor.swift
//  CursoiOSProyecto4
//
//  Created by Abrahán Fernández on 1/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import PromiseKit

class FormInteractor: BaseInteractor, FormInteractorContract {
    weak var output: FormInteractorOutputContract!

    var provider: LoginProviderContract

    private let kUsername = "username"
    private let kEmail = "email"
    private let kPassword = "password"
    
    required init (loginProvider: LoginProviderContract) {
        self.provider = loginProvider
    }

    func sendLoginData(username: String, email: String, password: String) -> Promise<Void> {
        let dataDictionary = [kUsername: username,
                              kEmail: email,
                              kPassword: password]

        return provider.sendFormData(formData: dataDictionary)
    }
}
