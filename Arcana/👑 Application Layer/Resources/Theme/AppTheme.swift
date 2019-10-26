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
        case .dark:
            return .default
        }
    }
    
    // MARK: - Window background color
    /// hex F0F0F0
    public static var backgroundMain: [UIColor] {
        switch AppThemeManager.current.type {
        case .dark:
            return [UIColor(hex: "283D5B", alpha: 1.0),
                    UIColor(hex: "081426", alpha: 1.0)]
        }
    }
    
    /// hex FFFFFF
    public static func backgroundContent(alpha: CGFloat = 1.0) -> UIColor {
        switch AppThemeManager.current.type {
        case .dark:
            return UIColor(hex: "101E34", alpha: alpha)
        }
    }
    
    public static func backgroundControl(alpha: CGFloat = 1.0) -> UIColor {
        switch AppThemeManager.current.type {
        case .dark:
            return UIColor(hex: "1A2F51", alpha: alpha)
        }
    }
    
    // MARK: - Shadow for content
    public static var backgroundShadow: UIColor {
        switch AppThemeManager.current.type {
        case .dark:
            return UIColor(hex: "101E34", alpha: 1.0)
        }
    }

    // MARK: - Accent colors of the app
    public static var accentMain: UIColor {
        switch AppThemeManager.current.type {
        case .dark:
            return UIColor(hex: "04E785", alpha: 1.0)
        }
    }
    
    public static var accentGradient: [UIColor] {
        switch AppThemeManager.current.type {
        case .dark:
            return [UIColor(hex: "00FF91", alpha: 1.0),
                    UIColor(hex: "0BB46B", alpha: 1.0)]
        }
    }

    // MARK: - Text color on accent background
    public static var accentTextMain: UIColor {
        switch AppThemeManager.current.type {
        case .dark:
            return UIColor(hex: "101E34", alpha: 1.0)
        }
    }
    
    public static var accentTextSub: UIColor {
        switch AppThemeManager.current.type {
        case .dark:
            return UIColor(hex: "B0B0B4", alpha: 1.0)
        }
    }

    // MARK: - Text colors
    public static var textMain: UIColor {
        switch AppThemeManager.current.type {
        case .dark:
            return UIColor(hex: "FFFFFF", alpha: 1.0)
        }
    }
    
    public static var textSub: UIColor {
        switch AppThemeManager.current.type {
        case .dark:
            return UIColor(hex: "6E8EC1", alpha: 1.0)
        }
    }
    
}
