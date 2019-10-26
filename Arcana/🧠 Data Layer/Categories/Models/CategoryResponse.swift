//
//  CategoryResponse.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKNetwork

class CategoryResponse: Codable {
    let id: Int?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id    = "id"
        case name  = "name"
    }
}

extension CategoryResponse: RemoteMappable {
    
    func mapResponseToDomain() -> AnyObject? {
        guard let id = self.id else { return nil }
        
        let categoryModel = CategoryModel(identifier: id)
        categoryModel.name = self.name ?? ""
        
        return categoryModel
    }
    
}
