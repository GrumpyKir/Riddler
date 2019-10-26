//
//  MainRouter.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol MainRouterInput: ViperRouterInput { }

class MainRouter: ViperRouter, MainRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: MainViewController? {
        guard let mainController = self._mainController as? MainViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - MainRouterInput
    
    // MARK: - Module functions
}
