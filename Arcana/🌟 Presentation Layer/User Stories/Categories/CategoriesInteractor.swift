//
//  CategoriesInteractor.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol CategoriesInteractorInput: ViperInteractorInput {
    func loadCategories()
}

protocol CategoriesInteractorOutput: ViperInteractorOutput {
    func provideCategories(_ categories: [CategoryModel])
}

open class CategoriesInteractor: ViperInteractor, CategoriesInteractorInput {

    // MARK: - Props
    private var output: CategoriesInteractorOutput? {
        guard let output = self._output as? CategoriesInteractorOutput else {
            return nil
        }
        return output
    }
    
    var categoriesUseCase: CategoriesUseCaseInput
    
    // MARK: - Initialization
    override init() {
        self.categoriesUseCase = CategoriesUseCase()
        
        super.init()
        
        self.categoriesUseCase.subscribe(with: self)
    }
    
    // MARK: - CategoriesInteractorInput
    func loadCategories() {
        self.categoriesUseCase.loadCategories()
    }
    
    // MARK: - Module functions
}

extension CategoriesInteractor: CategoriesUseCaseOutput {
    
    func provideCategories(_ categories: [CategoryModel]) {
        self.output?.provideCategories(categories)
    }
    
}
