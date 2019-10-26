//
//  InitialViewController.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol InitialViewInput: ViperViewInput { }

protocol InitialViewOutput: ViperViewOutput { }

class InitialViewController: ViperViewController, InitialViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var logoImageView: UIImageView!
    
    // MARK: - Props
    fileprivate var output: InitialViewOutput? {
        guard let output = self._output as? InitialViewOutput else { return nil }
        return output
    }
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = InitialLocalization.navigationTitle.localized
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.logoImageView.image = AppAssets.wipLogo
    }
    
    func setupActions() { }
    
    func applyStyles() {
        self.view.apply(.backgroundViewStyle())
        self.logoImageView.apply(.generalStyle())
    }
    
    // MARK: - InitialViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension InitialViewController { }

// MARK: - Animations
extension InitialViewController { }

// MARK: - Module functions
extension InitialViewController { }
