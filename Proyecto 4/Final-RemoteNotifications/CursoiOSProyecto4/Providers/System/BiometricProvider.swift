//
//  BiometricProvider.swift
//  CursoiOSProyecto4
//
//  Created by Abrahán Fernández on 2/3/21.
//

import Foundation
import LocalAuthentication
import PromiseKit

protocol BiometricProviderContract {
    func biometricAuthEnable() -> Promise<Bool>
    func launchBiometricAuthentication() -> Promise<Bool>
    /// This mehotd only has meaningfull value after biometricAuthEnable has been call.
    func biometricIsFaceID() -> Bool
}

class BiometricProvider: BiometricProviderContract {
    var context: LAContext!

    init() {
        context = LAContext()
        context.localizedCancelTitle = "Introduce username & password"
    }

    func biometricAuthEnable() -> Promise<Bool> {
        return Promise<Bool> { promise in
            var error: NSError?
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                promise.fulfill(true)
            } else {
                promise.fulfill(false)
            }
        }
    }

    func launchBiometricAuthentication() -> Promise<Bool> {
        return Promise<Bool> { promise in
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: "Login") { success, _ in
                promise.fulfill(success)
            }
        }
    }

    func biometricIsFaceID() -> Bool {
        return context.biometryType == .faceID
    }
}
