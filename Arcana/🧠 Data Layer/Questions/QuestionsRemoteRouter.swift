//
//  QuestionsRemoteRouter.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKNetwork

enum QuestionsRemoteRouter {
    case randomQuestion(categories: String, sessionId: String)
    
    var method: HTTPMethod {
        switch self {
        case .randomQuestion:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .randomQuestion:
            return "\(AppConfiguration.serverApi)/get_random_question"
        }
    }
    
    var request: URLRequest? {
        switch self {
        case let .randomQuestion(categories, sessionId):
            let headers: [String: String] = ["Language": AppLocalizationManager.current.type.languageKey]
            
            let parameters: [String: Any] = ["categories": categories,
                                             "uuid": sessionId]
            
            return RemoteFactory.request(path: self.path, parameters: parameters, headers: headers, method: self.method)
        }
    }
    
}
