//
//  CategoriesPresenter.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol CategoriesPresenterInput: ViperPresenterInput { }

class CategoriesPresenter: ViperPresenter, CategoriesPresenterInput, CategoriesViewOutput, CategoriesInteractorOutput {
    
    // MARK: - Props
    fileprivate var view: CategoriesViewInput? {
        guard let view = self._view as? CategoriesViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var interactor: CategoriesInteractorInput? {
        guard let interactor = self._interactor as? CategoriesInteractorInput else {
            return nil
        }
        return interactor
    }
    
    fileprivate var router: CategoriesRouterInput? {
        guard let router = self._router as? CategoriesRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: CategoriesViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = CategoriesViewModel()
    }
    
    // MARK: - CategoriesPresenterInput
    
    // MARK: - CategoriesViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
    
    // MARK: - CategoriesInteractorOutput
    
    // MARK: - Module functions
}
