//
//  QuestionComplexModel.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation

class QuestionComplexModel: Equatable {
    var question: QuestionModel
    var isLast: Bool
    
    init(question: QuestionModel, isLast: Bool) {
        self.question = question
        self.isLast = isLast
    }
    
    static func == (lhs: QuestionComplexModel, rhs: QuestionComplexModel) -> Bool {
        return lhs.question == rhs.question
            && lhs.isLast == rhs.isLast
    }
}
