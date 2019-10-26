//
//  MainAssembly.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

enum MainAssembly {
    
    // Create and return controller
    static func create() -> MainViewController {
        return MainViewController(nibName: MainViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: MainViewController) -> MainPresenterInput {
        let presenter = MainPresenter()
        
        let interactor = MainInteractor()
        interactor._output = presenter
        
        let router = MainRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._interactor = interactor
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
