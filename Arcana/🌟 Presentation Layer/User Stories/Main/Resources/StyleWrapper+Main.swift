//
//  StyleWrapper+Main.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import UIKit

extension StyleWrapper where Element: UIButton {
    
    /// make button corner radius = 8
    static func startButtonStyle() -> StyleWrapper {
        return .wrap { button in
            button.setTitleColor(AppTheme.textMain, for: [])
            button.backgroundColor = AppTheme.backgroundContent
            button.layer.cornerRadius = button.bounds.height * 0.5
            button.layer.masksToBounds = true
        }
    }
    
    static func helpButtonStyle() -> StyleWrapper {
        return .wrap { button in
            button.setTitleColor(AppTheme.textMain, for: [])
            button.backgroundColor = AppTheme.backgroundContent
            button.layer.cornerRadius = button.bounds.height * 0.5
            button.layer.masksToBounds = true
        }
    }
    
}
