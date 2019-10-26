//
//  FiraSans.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import UIKit

enum FiraSans {
    case extraBold
    case regular
    case semibold
    
    public func font(size: CGFloat) -> UIFont {
        switch self {
        case .extraBold:
            if let font = UIFont(name: "FiraSans-ExtraBold", size: size) {
                return font
            }
            return UIFont.systemFont(ofSize: size, weight: .bold)
        case .regular:
            if let font = UIFont(name: "FiraSans-Regular", size: size) {
                return font
            }
            return UIFont.systemFont(ofSize: size, weight: .regular)
        case .semibold:
            if let font = UIFont(name: "FiraSans-SemiBold", size: size) {
                return font
            }
            return UIFont.systemFont(ofSize: size, weight: .semibold)
        }
    }
}
