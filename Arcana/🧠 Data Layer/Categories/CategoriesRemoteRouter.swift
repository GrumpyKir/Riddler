//
//  CategoriesRemoteRouter.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKNetwork

enum CategoriesRemoteRouter {
    case categoryList
    
    var method: HTTPMethod {
        switch self {
        case .categoryList:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .categoryList:
            return "\(AppConfiguration.serverApi)/categories"
        }
    }
    
    var request: URLRequest? {
        switch self {
        case .categoryList:
            let headers: [String: String] = ["Language": AppLocalizationManager.current.type.languageKey]
            
            return RemoteFactory.request(path: self.path, parameters: nil, headers: headers, method: self.method)
        }
    }
    
}
