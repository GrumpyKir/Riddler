//
//  CategoriesUseCase.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKUseCase

protocol CategoriesUseCaseInput: UseCaseInput {
    func loadCategories()
}

protocol CategoriesUseCaseOutput: UseCaseOutput {
    func provideCategories(_ categories: [CategoryModel])
}

extension CategoriesUseCaseOutput {
    func provideCategories(_ categories: [CategoryModel]) { }
}

class CategoriesUseCase: UseCase, CategoriesUseCaseInput {
    
    // MARK: - Props
    private var output: CategoriesUseCaseOutput? {
        guard let output = self._output as? CategoriesUseCaseOutput else {
            return nil
        }
        return output
    }
    
    private lazy var categoriesRepository: CategoriesRepositoryInterface = CategoriesRepository()
    
    // MARK: - Initialization
    override public init() {
        super.init()
    }
    
    // MARK: - CategoriesUseCaseInput
    func loadCategories() {
        self.categoriesRepository.remoteCategories { categories in
            self.output?.provideCategories(categories)
        }
    }
    
}
