//
//  StylyWrapper+Categories.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import UIKit
import ChameleonFramework

extension StyleWrapper where Element: UIVisualEffectView {
    
    static func blurBackgroundStyle() -> StyleWrapper {
        return .wrap { view in
            view.effect = UIBlurEffect(style: .dark)
        }
    }
    
}

extension StyleWrapper where Element: UITableView {
    
    static func categoriesTableViewStyle() -> StyleWrapper {
        return .wrap { table in
            table.backgroundColor = .clear
            table.separatorColor = .clear
            table.showsVerticalScrollIndicator = true
            table.showsHorizontalScrollIndicator = false
            table.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        }
    }
    
}

extension StyleWrapper where Element: UIView {
    
    static func backgrondStyle() -> StyleWrapper {
        return .wrap { view in
            view.backgroundColor = GradientColor(.topToBottom, frame: view.bounds, colors: AppTheme.backgroundMain)
            view.alpha = 0.5
        }
    }
    
    static func backBackgrondStyle() -> StyleWrapper {
        return .wrap { view in
            view.backgroundColor = AppTheme.backgroundContent(alpha: 0.5)
            view.layer.cornerRadius = view.bounds.height * 0.5
            view.layer.masksToBounds = true
        }
    }
    
    static func categoriesBackgroundStyle() -> StyleWrapper {
        return .wrap { view in
            view.backgroundColor = AppTheme.backgroundContent(alpha: 0.5)
            view.layer.cornerRadius = 20.0
            view.layer.masksToBounds = true
        }
    }
    
}

extension StyleWrapper where Element: UIImageView {
    
    static func backImageStyle() -> StyleWrapper {
        return .wrap { image in
            image.image = AppAssets.backIcon
            image.contentMode = .scaleAspectFit
        }
    }
    
}

extension StyleWrapper where Element: UILabel {
    
    static func backTitleStyle() -> StyleWrapper {
        return .wrap { label in
            label.font = FiraSans.regular.font(size: 16.0)
            label.textColor = AppTheme.accentMain
            label.textAlignment = .left
            label.numberOfLines = 1
        }
    }
    
    static func categoriesTitleStyle() -> StyleWrapper {
        return .wrap { label in
            label.font = FiraSans.semibold.font(size: 24.0)
            label.textColor = AppTheme.accentMain
            label.textAlignment = .left
            label.numberOfLines = 1
        }
    }
    
}

extension StyleWrapper where Element: UIButton {
    
    static func startButtonStyle() -> StyleWrapper {
        return .wrap { button in
            button.setTitleColor(AppTheme.accentTextMain, for: [])
            button.titleLabel?.font = FiraSans.semibold.font(size: 24.0)
            button.backgroundColor = GradientColor(.topToBottom, frame: button.bounds, colors: AppTheme.accentGradient)
            button.layer.cornerRadius = button.bounds.height * 0.5
            button.layer.masksToBounds = true
        }
    }
    
    static func backButtonStyle() -> StyleWrapper {
        return .wrap { button in
            button.setTitle("", for: [])
            button.backgroundColor = .clear
            button.layer.cornerRadius = button.bounds.height * 0.5
            button.layer.masksToBounds = true
        }
    }
    
}
