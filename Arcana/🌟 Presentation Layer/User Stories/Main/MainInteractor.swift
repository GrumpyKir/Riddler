//
//  MainInteractor.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol MainInteractorInput: ViperInteractorInput { }

protocol MainInteractorOutput: ViperInteractorOutput { }

open class MainInteractor: ViperInteractor, MainInteractorInput {

    // MARK: - Props
    private var output: MainInteractorOutput? {
        guard let output = self._output as? MainInteractorOutput else {
            return nil
        }
        return output
    }
    
    // MARK: - Initialization
    override init() {        
        super.init()
    }
    
    // MARK: - MainInteractorInput
    
    // MARK: - Module functions
}
