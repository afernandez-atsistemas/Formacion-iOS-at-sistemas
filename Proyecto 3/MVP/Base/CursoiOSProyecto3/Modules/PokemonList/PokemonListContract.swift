//
//  PokemonListContract.swift
//  CursoiOSProyecto3_Base
//
//  Created by Abrahán Fernández on 1/2/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit
import PromiseKit

protocol PokemonListViewContract: BaseViewController {
    var presenter: PokemonListPresenterContract! { get set }
    
}

protocol PokemonListPresenterContract: BasePresenter {
    var view: PokemonListViewContract? { get set }
    
    func viewWillAppear()
    func viewDidLoad()
}
