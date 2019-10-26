//
//  StyleWrapper.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import UIKit
import ChameleonFramework

typealias Style<Element> = (Element) -> Void

enum StyleWrapper<Element> {
    case wrap(style: Style<Element>)
}

extension StyleWrapper where Element: UIView {
    
    static func backgroundViewStyle() -> StyleWrapper {
        return .wrap { view in
            view.backgroundColor = GradientColor(.topToBottom, frame: view.bounds, colors: AppTheme.backgroundMain)
        }
    }
    
    static func backgroundClearStyle() -> StyleWrapper {
        return .wrap { view in
            view.backgroundColor = .clear
        }
    }
    
}

extension StyleWrapper where Element: UIImageView {
    
    static func generalFitStyle() -> StyleWrapper {
        return .wrap { imageView in
            imageView.contentMode = .scaleAspectFit
            imageView.layer.masksToBounds = true
        }
    }
    
    static func generalFillStyle() -> StyleWrapper {
        return .wrap { imageView in
            imageView.contentMode = .scaleAspectFill
            imageView.layer.masksToBounds = true
        }
    }
    
}
