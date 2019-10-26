//
//  StyleWrapper+Main.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import UIKit

extension StyleWrapper where Element: UIButton {
    
    static func categoriesButtonStyle() -> StyleWrapper {
        return .wrap { button in
            button.setTitle(MainLocalization.startButtonTitle.localized, for: [])
            button.setTitleColor(AppTheme.textMain, for: [])
            button.backgroundColor = AppTheme.backgroundContent
            button.layer.cornerRadius = button.bounds.height * 0.5
            button.layer.masksToBounds = true
        }
    }
    
    static func settingsButtonStyle() -> StyleWrapper {
        return .wrap { button in
            button.setTitle(MainLocalization.settingsButtonTitle.localized, for: [])
            button.setTitleColor(AppTheme.textMain, for: [])
            button.backgroundColor = AppTheme.backgroundContent
            button.layer.cornerRadius = button.bounds.height * 0.5
            button.layer.masksToBounds = true
        }
    }
    
    static func helpButtonStyle() -> StyleWrapper {
        return .wrap { button in
            button.setTitle(MainLocalization.helpButtonTitle.localized, for: [])
            button.setTitleColor(AppTheme.textMain, for: [])
            button.backgroundColor = AppTheme.backgroundContent
            button.layer.cornerRadius = button.bounds.height * 0.5
            button.layer.masksToBounds = true
        }
    }
    
}
