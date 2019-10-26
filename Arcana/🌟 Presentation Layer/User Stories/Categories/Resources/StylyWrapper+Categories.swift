//
//  StylyWrapper+Categories.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import UIKit

extension StyleWrapper where Element: UIView {
    
    static func categoriesBackgroundStyle() -> StyleWrapper {
        return .wrap { view in
            view.backgroundColor = AppTheme.backgroundMain
            view.alpha = 0.5
        }
    }
    
}

extension StyleWrapper where Element: UITableView {
    
    static func categoriesTableViewStyle(topInset: CGFloat, bottomInset: CGFloat) -> StyleWrapper {
        return .wrap { table in
            table.backgroundColor = .clear
            table.separatorColor = .clear
            table.showsVerticalScrollIndicator = true
            table.showsHorizontalScrollIndicator = false
            table.contentInset = UIEdgeInsets(top: topInset, left: 0.0, bottom: bottomInset, right: 0.0)
        }
    }
    
}

extension StyleWrapper where Element: UIButton {
    
    static func startButtonStyle() -> StyleWrapper {
        return .wrap { button in
            button.setTitleColor(AppTheme.textMain, for: [])
            button.backgroundColor = AppTheme.backgroundContent
            button.layer.cornerRadius = button.bounds.height * 0.5
            button.layer.masksToBounds = true
        }
    }
    
    static func closeButtonStyle() -> StyleWrapper {
        return .wrap { button in
            button.setTitleColor(AppTheme.textMain, for: [])
            button.backgroundColor = AppTheme.backgroundContent
            button.layer.cornerRadius = button.bounds.height * 0.5
            button.layer.masksToBounds = true
        }
    }
    
}
