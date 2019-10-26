//
//  InitialInteractor.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol InitialInteractorInput: ViperInteractorInput { }

protocol InitialInteractorOutput: ViperInteractorOutput { }

open class InitialInteractor: ViperInteractor, InitialInteractorInput {

    // MARK: - Props
    private var output: InitialInteractorOutput? {
        guard let output = self._output as? InitialInteractorOutput else {
            return nil
        }
        return output
    }
    
    // MARK: - Initialization
    override init() {        
        super.init()
    }
    
    // MARK: - InitialInteractorInput
    
    // MARK: - Module functions
}
