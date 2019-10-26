//
//  AppTheme.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKExtensions
import ChameleonFramework

enum AppTheme {
    
    // MARK: - Status bar style
    public static var statusBarStyle: UIStatusBarStyle {
        switch AppThemeManager.current.type {
        case .light:
            return .default
        }
    }
    
    // MARK: - Window background color
    /// hex F0F0F0
    public static var backgroundMain: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "F0F0F0", alpha: 1.0)
        }
    }
    
    /// hex FFFFFF
    public static var backgroundContent: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "FFFFFF", alpha: 1.0)
        }
    }
    
    // MARK: - Shadow for content
    public static var backgroundShadow: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "989AA6", alpha: 1.0)
        }
    }

    // MARK: - Accent colors of the app
    /// hex 33333A
    public static var accentBackground: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "33333A", alpha: 1.0)
        }
    }
    
    public static var accentBackgroundGradient: [UIColor] {
        switch AppThemeManager.current.type {
        case .light:
            return [UIColor(hex: "212126", alpha: 1.0),
                    UIColor(hex: "424249", alpha: 1.0),
                    UIColor(hex: "76767D", alpha: 1.0)]
        }
    }
    
    public static var accentMain: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "FF5E2C", alpha: 1.0)
        }
    }

    // MARK: - Text color on accent background
    public static var accentTextMain: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "FFFFFF", alpha: 1.0)
        }
    }
    
    public static var accentTextSub: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "B0B0B4", alpha: 1.0)
        }
    }

    // MARK: - Text colors
    public static var textMain: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "424249", alpha: 1.0)
        }
    }

    public static var textSub: UIColor {
        switch AppThemeManager.current.type {
        case .light:
            return UIColor(hex: "B4B4B6", alpha: 1.0)
        }
    }
    
}
