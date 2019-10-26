//
//  StyleWrapper+Game.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import UIKit
import ChameleonFramework

extension StyleWrapper where Element: UIView {
    
    static func questionCardStyle() -> StyleWrapper {
        return .wrap { view in
            view.backgroundColor = .white
            view.layer.cornerRadius = 20.0
            view.layer.masksToBounds = true
        }
    }
    
}

extension StyleWrapper where Element: UIButton {
    
    static func closeButtonStyle() -> StyleWrapper {
        return .wrap { button in
            button.setTitle("", for: [])
            button.backgroundColor = .clear
            button.layer.cornerRadius = button.bounds.height * 0.5
            button.layer.masksToBounds = true
        }
    }
    
    static func nextButtonStyle() -> StyleWrapper {
        return .wrap { button in
            button.setTitleColor(AppTheme.accentMain, for: [])
            button.titleLabel?.font = FiraSans.semibold.font(size: 24.0)
        }
    }
    
}

extension StyleWrapper where Element: UIImageView {
    
    static func closeImageStyle() -> StyleWrapper {
        return .wrap { image in
            image.image = AppAssets.closeIcon
            image.contentMode = .scaleAspectFit
        }
    }
    
}

extension StyleWrapper where Element: UILabel {
    
    static func closeTitleStyle() -> StyleWrapper {
        return .wrap { label in
            label.font = FiraSans.regular.font(size: 16.0)
            label.textColor = AppTheme.textMain
            label.textAlignment = .right
            label.numberOfLines = 1
        }
    }
    
    static func pointsTitleStyle() -> StyleWrapper {
        return .wrap { label in
            label.font = FiraSans.semibold.font(size: 24.0)
            label.textColor = AppTheme.accentMain
            label.textAlignment = .left
            label.numberOfLines = 1
        }
    }
    
    static func questionTitleStyle() -> StyleWrapper {
        return .wrap { label in
            label.font = FiraSans.semibold.font(size: 28.0)
            label.textColor = AppTheme.backgroundControl()
            label.textAlignment = .left
            label.numberOfLines = 0
        }
    }
    
}
