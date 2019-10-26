//
//  CategoryCellModel.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKRepresentable

class CategoryCellModel: TableCellModel {
    
    public override var cellIdentifier: String {
        return CategoryCell.identifier
    }
    
    public override var cellHeight: CGFloat {
        return UITableView.automaticDimension
    }
    
    var category: CategoryModel
    var isSelected: Bool
    
    init(category: CategoryModel) {
        self.category = category
        self.isSelected = false
    }
    
}
