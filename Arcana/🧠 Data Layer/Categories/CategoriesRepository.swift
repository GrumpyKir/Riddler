//
//  CategoriesRepository.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKUseCase

protocol CategoriesRepositoryInterface: RepositoryInterface {
    func remoteCategories(completion: @escaping (_ result: [CategoryModel]) -> Void)
}

class CategoriesRepository: RiddlerRepository, CategoriesRepositoryInterface {
    
    // MARK: - Props
    
    // MARK: - CategoriesRepositoryInterface
    func remoteCategories(completion: @escaping (_ result: [CategoryModel]) -> Void) {
        guard let request = CategoriesRemoteRouter.categoryList.request else {
            completion([])

            return
        }

        self.execute(request, response: [CategoryResponse].self) { (result, _, error) in
            if let mappedResult = result as? [CategoryModel], error == nil {
                completion(mappedResult)
            } else {
                completion([])
            }
        }
    }
    
}
