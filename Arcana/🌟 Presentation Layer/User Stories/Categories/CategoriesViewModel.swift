//
//  CategoriesViewModel.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

class CategoriesViewModel: ViperViewModel {
    var categories: [CategoryModel]
    var selectedCategories: [Int]
    
    override init() {
        self.categories = []
        self.selectedCategories = []
    }
}
