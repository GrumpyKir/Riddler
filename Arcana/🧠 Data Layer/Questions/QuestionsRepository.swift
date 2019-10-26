//
//  QuestionsRepository.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKUseCase

protocol QuestionsRepositoryInterface: RepositoryInterface {
    func remoteQuestion(categories: String, sessionId: String, completion: @escaping (_ result: QuestionComplexModel?) -> Void)
}

class QuestionsRepository: RiddlerRepository, QuestionsRepositoryInterface {
    
    // MARK: - Props
    
    // MARK: - CategoriesRepositoryInterface
    func remoteQuestion(categories: String, sessionId: String, completion: @escaping (_ result: QuestionComplexModel?) -> Void) {
        guard let request = QuestionsRemoteRouter.randomQuestion(categories: categories, sessionId: sessionId).request else {
            completion(nil)

            return
        }

        self.execute(request, response: QuestionComplexResponse.self) { (result, _, error) in
            if let mappedResult = result as? QuestionComplexModel, error == nil {
                completion(mappedResult)
            } else {
                completion(nil)
            }
        }
    }
    
}
