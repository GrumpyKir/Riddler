//
//  GameRouter.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol GameRouterInput: ViperRouterInput { }

class GameRouter: ViperRouter, GameRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: GameViewController? {
        guard let mainController = self._mainController as? GameViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - GameRouterInput
    
    // MARK: - Module functions
}
