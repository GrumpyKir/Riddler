//
//  QuestionsUseCase.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKUseCase

protocol QuestionsUseCaseInput: UseCaseInput {
    func loadQuestion(categories: String)
}

protocol QuestionsUseCaseOutput: UseCaseOutput {
    func provideQuestion(_ question: QuestionComplexModel?)
}

extension QuestionsUseCaseOutput {
    func provideQuestion(_ question: QuestionComplexModel?) { }
}

class QuestionsUseCase: UseCase, QuestionsUseCaseInput {
    
    // MARK: - Props
    private var output: QuestionsUseCaseOutput? {
        guard let output = self._output as? QuestionsUseCaseOutput else {
            return nil
        }
        return output
    }
    
    private lazy var questionsRepository: QuestionsRepositoryInterface = QuestionsRepository()
    private var sessionId: String
    
    // MARK: - Initialization
    override public init() {
        self.sessionId = UUID().uuidString
        
        super.init()
    }
    
    // MARK: - QuestionsUseCaseInput
    func loadQuestion(categories: String) {
        self.questionsRepository.remoteQuestion(categories: categories, sessionId: self.sessionId) { questionComplexModel in
            self.output?.provideQuestion(questionComplexModel)
        }
    }
    
}
