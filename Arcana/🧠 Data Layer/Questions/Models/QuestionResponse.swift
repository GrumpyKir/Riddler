//
//  QuestionResponse.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKNetwork

class QuestionResponse: Codable {
    let id: Int?
    let text: String?
    
    enum CodingKeys: String, CodingKey {
        case id    = "id"
        case text  = "text"
    }
}

extension QuestionResponse: RemoteMappable {
    
    func mapResponseToDomain() -> AnyObject? {
        guard let id = self.id else { return nil }

        let questionModel = QuestionModel(identifier: id)
        questionModel.text = self.text ?? ""

        return questionModel
    }
    
}
