//
//  QuestionModel.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation

class QuestionModel: Equatable {
    var identifier: Int
    var text: String
    
    init(identifier: Int) {
        self.identifier = identifier
        self.text = ""
    }
    
    static func == (lhs: QuestionModel, rhs: QuestionModel) -> Bool {
        return lhs.identifier == rhs.identifier
            && lhs.text == rhs.text
    }
}
