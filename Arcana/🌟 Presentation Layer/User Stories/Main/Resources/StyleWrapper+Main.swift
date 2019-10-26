//
//  StyleWrapper+Main.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import UIKit
import ChameleonFramework

extension StyleWrapper where Element: UILabel {
    
    static func progressTitleStyle() -> StyleWrapper {
        return .wrap { label in
            label.font = FiraSans.semibold.font(size: 24.0)
            label.textColor = AppTheme.accentMain
            label.textAlignment = .center
            label.numberOfLines = 1
        }
    }
    
    static func progressHintStyle() -> StyleWrapper {
        return .wrap { label in
            label.font = FiraSans.regular.font(size: 12.0)
            label.textColor = AppTheme.textSub
            label.textAlignment = .center
            label.numberOfLines = 0
        }
    }
    
}

extension StyleWrapper where Element: UIButton {
    
    static func playButtonStyle() -> StyleWrapper {
        return .wrap { button in
            button.setTitle(MainLocalization.startButtonTitle.localized, for: [])
            button.setTitleColor(AppTheme.accentTextMain, for: [])
            button.titleLabel?.font = FiraSans.semibold.font(size: 24.0)
            button.backgroundColor = GradientColor(.topToBottom, frame: button.bounds, colors: AppTheme.accentGradient)
            button.layer.cornerRadius = button.bounds.height * 0.5
            button.layer.masksToBounds = true
        }
    }
    
    static func settingsButtonStyle() -> StyleWrapper {
        return .wrap { button in
            button.setTitle("", for: [])
            button.setImage(AppAssets.settingsIcon, for: [])
            button.imageView?.setImageColor(color: AppTheme.accentMain)
            button.backgroundColor = AppTheme.backgroundControl
            button.layer.cornerRadius = button.bounds.height * 0.5
            button.layer.masksToBounds = true
        }
    }
    
    static func helpButtonStyle() -> StyleWrapper {
        return .wrap { button in
            button.setTitle("", for: [])
            button.setImage(AppAssets.helpIcon, for: [])
            button.imageView?.setImageColor(color: AppTheme.accentMain)
            button.backgroundColor = AppTheme.backgroundControl
            button.layer.cornerRadius = button.bounds.height * 0.5
            button.layer.masksToBounds = true
        }
    }
    
}

extension StyleWrapper where Element: UIProgressView {
    
    static func progressStyle() -> StyleWrapper {
        return .wrap { progress in
            progress.progressTintColor = AppTheme.accentMain
            progress.trackTintColor = AppTheme.backgroundContent
        }
    }
    
}
