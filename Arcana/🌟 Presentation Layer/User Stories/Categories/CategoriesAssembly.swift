//
//  CategoriesAssembly.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

enum CategoriesAssembly {
    
    // Create and return controller
    static func create() -> CategoriesViewController {
        return CategoriesViewController(nibName: CategoriesViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: CategoriesViewController) -> CategoriesPresenterInput {
        let presenter = CategoriesPresenter()
        
        let interactor = CategoriesInteractor()
        interactor._output = presenter
        
        let router = CategoriesRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._interactor = interactor
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
