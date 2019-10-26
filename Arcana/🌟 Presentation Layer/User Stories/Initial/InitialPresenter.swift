//
//  InitialPresenter.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol InitialPresenterInput: ViperPresenterInput { }

class InitialPresenter: ViperPresenter, InitialPresenterInput, InitialViewOutput, InitialInteractorOutput {
    
    // MARK: - Props
    fileprivate var view: InitialViewInput? {
        guard let view = self._view as? InitialViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var interactor: InitialInteractorInput? {
        guard let interactor = self._interactor as? InitialInteractorInput else {
            return nil
        }
        return interactor
    }
    
    fileprivate var router: InitialRouterInput? {
        guard let router = self._router as? InitialRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: InitialViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = InitialViewModel()
    }
    
    // MARK: - InitialPresenterInput
    
    // MARK: - InitialViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
        
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { [weak self] _ in
            guard let strongSelf = self else { return }
            
            strongSelf.router?.presentMainViewController()
        })
    }
    
    // MARK: - InitialInteractorOutput
    
    // MARK: - Module functions
}
