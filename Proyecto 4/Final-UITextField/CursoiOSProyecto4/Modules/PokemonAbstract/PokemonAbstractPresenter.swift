//
//  PokemonAbstractPresenter.swift
//  CursoiOSProyecto4
//
//  Created by Abrahán Fernández on 22/2/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import PromiseKit

class PokemonAbstractPresenter: BasePresenter, PokemonAbstractPresenterContract {

    weak var view: PokemonAbstractViewContract!
    var interactor: PokemonAbstractInteractorContract!
    var entity: PokemonAbstractEntityContract!
    var wireframe: PokemonAbstractWireframeContract!

    func viewWillAppear() {
        firstly {
            interactor.getAbstract()
        }.done { attributedString in
            self.view.updateAbstract(html: attributedString)
        }.cauterize()
    }
    
    func viewDidLoad() {
       
    }
}

// MARK: - PokemonAbstractInteractorOutputContract
extension PokemonAbstractPresenter: PokemonAbstractInteractorOutputContract {
    
}

// MARK: - PokemonAbstractWireframeOutputContract
extension PokemonAbstractPresenter: PokemonAbstractWireframeOutputContract {
    
}
