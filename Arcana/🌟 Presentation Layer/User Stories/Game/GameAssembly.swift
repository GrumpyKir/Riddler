//
//  GameAssembly.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

enum GameAssembly {
    
    // Create and return controller
    static func create() -> GameViewController {
        return GameViewController(nibName: GameViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: GameViewController, categories: String) -> GamePresenterInput {
        let presenter = GamePresenter()
        
        let interactor = GameInteractor(categories: categories)
        interactor._output = presenter
        
        let router = GameRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._interactor = interactor
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
