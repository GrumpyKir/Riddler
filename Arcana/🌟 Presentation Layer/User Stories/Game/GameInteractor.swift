//
//  GameInteractor.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol GameInteractorInput: ViperInteractorInput {
    func loadQuestion()
}

protocol GameInteractorOutput: ViperInteractorOutput {
    func provideQuestion(_ question: QuestionComplexModel?)
}

open class GameInteractor: ViperInteractor, GameInteractorInput {

    // MARK: - Props
    private var output: GameInteractorOutput? {
        guard let output = self._output as? GameInteractorOutput else {
            return nil
        }
        return output
    }
    
    private var questionsUseCase: QuestionsUseCaseInput
    private var categories: String
    
    // MARK: - Initialization
    init(categories: String) {
        self.questionsUseCase = QuestionsUseCase()
        self.categories = categories
        
        super.init()
        
        self.questionsUseCase.subscribe(with: self)
    }
    
    // MARK: - GameInteractorInput
    func loadQuestion() {
        self.questionsUseCase.loadQuestion(categories: categories)
    }
    
    // MARK: - Module functions
}

extension GameInteractor: QuestionsUseCaseOutput {
    
    func provideQuestion(_ question: QuestionComplexModel?) {
        self.output?.provideQuestion(question)
    }
    
}
