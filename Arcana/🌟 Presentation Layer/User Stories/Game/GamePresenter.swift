//
//  GamePresenter.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol GamePresenterInput: ViperPresenterInput { }

class GamePresenter: ViperPresenter, GamePresenterInput, GameViewOutput, GameInteractorOutput {
    
    // MARK: - Props
    fileprivate var view: GameViewInput? {
        guard let view = self._view as? GameViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var interactor: GameInteractorInput? {
        guard let interactor = self._interactor as? GameInteractorInput else {
            return nil
        }
        return interactor
    }
    
    fileprivate var router: GameRouterInput? {
        guard let router = self._router as? GameRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: GameViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = GameViewModel()
    }
    
    // MARK: - GamePresenterInput
    
    // MARK: - GameViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
        
        self.loadNextQuestion()
    }
    
    func loadNextQuestion() {
        self.interactor?.loadQuestion()
    }
    
    // MARK: - GameInteractorOutput
    func provideQuestion(_ question: QuestionComplexModel?) {
        if let question = question {
            self.view?.updateQuestion(title: question.question.text)
        } else {
            self.router?.dismiss(animated: true)
        }
    }
    
    // MARK: - Module functions
}
