//
//  AppThemeManager.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import UIKit

enum AppThemeType: String {
    case dark = "THEME_LIGHT"
    
    static let base: AppThemeType = .dark
    
    init(value: String?) {
        if let value = value {
            switch value {
            case AppThemeType.dark.rawValue:
                self = .dark
            default:
                self = AppThemeType.base
            }
        } else {
            self = AppThemeType.base
        }
    }
    
    var key: String {
        return self.rawValue
    }
    
    var title: String {
        switch self {
        case .dark:
            return AppLocalization.Theme.light.localized
        }
    }
}

class AppThemeManager {
    
    // MARK: - Setup prop
    private static var currentTheme: AppThemeManager {
        let storedThemeData = UserDefaults.standard.string(forKey: AppDefaults.activeTheme)
        let storedTheme = AppThemeType(value: storedThemeData)
        
        if storedThemeData == nil {
            UserDefaults.standard.set(storedTheme.key, forKey: AppDefaults.activeTheme)
        }
        
        return AppThemeManager(currentType: storedTheme)
    }
    
    // MARK: - Initialization
    private init(currentType: AppThemeType) {
        self.currentType = currentType
    }
    
    // MARK: - Accessor
    public static var current: AppThemeManager {
        return self.currentTheme
    }
    
    // MARK: - Supported themes
    public static var list: [AppThemeType] {
        return [.dark]
    }
    
    // MARK: - Props
    private var currentType: AppThemeType
    
    public var type: AppThemeType {
        return self.currentType
    }
    
    // MARK: - Public functions
    public func change(theme type: AppThemeType) {
        UserDefaults.standard.set(type.key, forKey: AppDefaults.activeTheme)
    }
    
}
