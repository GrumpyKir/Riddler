//
//  CategoriesRouter.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol CategoriesRouterInput: ViperRouterInput { }

class CategoriesRouter: ViperRouter, CategoriesRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: CategoriesViewController? {
        guard let mainController = self._mainController as? CategoriesViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - CategoriesRouterInput
    
    // MARK: - Module functions
}
