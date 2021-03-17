//
//  PokemonAbstractInteractor.swift
//  CursoiOSProyecto4
//
//  Created by Abrahán Fernández on 22/2/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import PromiseKit

class PokemonAbstractInteractor: BaseInteractor, PokemonAbstractInteractorContract {
    weak var output: PokemonAbstractInteractorOutputContract!

    var provider: PokemonAbstractProviderContract
    
    init (provider: PokemonAbstractProviderContract) {
        self.provider = provider
    }

    func getAbstract() -> Promise<NSAttributedString> {
        return Promise<NSAttributedString> { promise in
            firstly {
                provider.getAbstractInfo()
            }.done { htmlString in
                let attrStr = try! NSAttributedString(
                    data: htmlString.data(using: .unicode, allowLossyConversion: true)!,
                    options: [.documentType: NSAttributedString.DocumentType.html,
                              .characterEncoding: String.Encoding.utf8.rawValue],
                    documentAttributes: nil)
                promise.fulfill(attrStr)
            }.cauterize()
        }
    }
}
