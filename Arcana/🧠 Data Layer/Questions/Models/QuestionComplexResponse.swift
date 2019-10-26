//
//  QuestionComplexResponse.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKNetwork

class QuestionComplexResponse: Codable {
    let question: QuestionResponse?
    let isLast: Bool?
    
    enum CodingKeys: String, CodingKey {
        case question   = "question"
        case isLast     = "isLast"
    }
}

extension QuestionComplexResponse: RemoteMappable {
    
    func mapResponseToDomain() -> AnyObject? {
        guard let question = self.question?.mapResponseToDomain() as? QuestionModel else { return nil }
        guard let isLast = self.isLast else { return nil }

        let questionComplexModel = QuestionComplexModel(question: question, isLast: isLast)

        return questionComplexModel
    }
    
}
