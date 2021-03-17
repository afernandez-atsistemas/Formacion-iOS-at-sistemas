//
//  LoginInteractor.swift
//  CursoiOSProyecto4
//
//  Created by Abrahán Fernández on 3/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import PromiseKit

class LoginInteractor: BaseInteractor, LoginInteractorContract {

    enum LoginError: Error {
        case biometricDisable, loginFail
    }

    weak var output: LoginInteractorOutputContract!

    var biometricProvider: BiometricProviderContract
    var notificationsProvider: NotificationsProviderContract
    
    init (biometricProvider: BiometricProviderContract,
          notificationsProvider: NotificationsProviderContract) {
        self.biometricProvider = biometricProvider
        self.notificationsProvider = notificationsProvider
    }

    func tryBiometricLogin() -> Promise<Bool> {
        return Promise<Bool> { promise in
            firstly {
                biometricProvider.biometricAuthEnable()
            }.done { isEnable in
                if isEnable {
                    self.biometricProvider.launchBiometricAuthentication().done { success in
                        if success {
                            promise.fulfill(true)
                        } else {
                            throw LoginError.loginFail
                        }
                    }.catch { _ in
                        promise.fulfill(false)
                    }
                } else {
                    throw LoginError.biometricDisable
                }
            }.catch { error in
                promise.fulfill(false)
            }
        }
    }

    func authNotification() {
        firstly {
            notificationsProvider.requestAuthorizationForNotifications()
        }.done { result in
            if result {
                self.notificationsProvider.registerDeviceForNotifications()
            }
        }.cauterize()
    }
}
