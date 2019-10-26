//
//  MainPresenter.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol MainPresenterInput: ViperPresenterInput { }

class MainPresenter: ViperPresenter, MainPresenterInput, MainViewOutput, MainInteractorOutput {
    
    // MARK: - Props
    fileprivate var view: MainViewInput? {
        guard let view = self._view as? MainViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var interactor: MainInteractorInput? {
        guard let interactor = self._interactor as? MainInteractorInput else {
            return nil
        }
        return interactor
    }
    
    fileprivate var router: MainRouterInput? {
        guard let router = self._router as? MainRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: MainViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = MainViewModel()
    }
    
    // MARK: - MainPresenterInput
    
    // MARK: - MainViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
    
    // MARK: - MainInteractorOutput
    
    // MARK: - Module functions
}
