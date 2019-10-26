//
//  MainRouter.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol MainRouterInput: ViperRouterInput {
    func presentCategoriesController()
}

class MainRouter: ViperRouter, MainRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: MainViewController? {
        guard let mainController = self._mainController as? MainViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - MainRouterInput
    func presentCategoriesController() {
        let vc = CategoriesAssembly.create()
        _ = CategoriesAssembly.configure(with: vc)
        
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        
        self.present(vc, animated: true)
    }
    
    // MARK: - Module functions
}
