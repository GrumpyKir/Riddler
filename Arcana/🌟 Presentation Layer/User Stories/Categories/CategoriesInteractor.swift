//
//  CategoriesInteractor.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol CategoriesInteractorInput: ViperInteractorInput { }

protocol CategoriesInteractorOutput: ViperInteractorOutput { }

open class CategoriesInteractor: ViperInteractor, CategoriesInteractorInput {

    // MARK: - Props
    private var output: CategoriesInteractorOutput? {
        guard let output = self._output as? CategoriesInteractorOutput else {
            return nil
        }
        return output
    }
    
    // MARK: - Initialization
    override init() {        
        super.init()
    }
    
    // MARK: - CategoriesInteractorInput
    
    // MARK: - Module functions
}
