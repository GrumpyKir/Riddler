//
//  CategoryModel.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation

class CategoryModel: Equatable {
    var identifier: Int
    var name: String
    
    init(identifier: Int) {
        self.identifier = identifier
        self.name = ""
    }
    
    static func == (lhs: CategoryModel, rhs: CategoryModel) -> Bool {
        return lhs.identifier == rhs.identifier
            && lhs.name == rhs.name
    }
}
