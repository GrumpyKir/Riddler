//
//  MainViewController.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol MainViewInput: ViperViewInput { }

protocol MainViewOutput: ViperViewOutput { }

class MainViewController: ViperViewController, MainViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var helpButton: UIButton!
    
    // MARK: - Props
    fileprivate var output: MainViewOutput? {
        guard let output = self._output as? MainViewOutput else { return nil }
        return output
    }
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = MainLocalization.navigationTitle.localized
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                
        self.logoImageView.image = AppAssets.wipLogo
        self.startButton.setTitle(MainLocalization.startButtonTitle.localized, for: [])
        self.helpButton.setTitle(MainLocalization.helpButtonTitle.localized, for: [])
        
        self.startupAnimation()
    }
    
    func setupActions() { }
    
    func applyStyles() {
        self.view.apply(.backgroundViewStyle())
        self.logoImageView.apply(.generalStyle())
        self.startButton.apply(.startButtonStyle())
        self.helpButton.apply(.helpButtonStyle())
    }
    
    // MARK: - MainViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension MainViewController { }

// MARK: - Animations
extension MainViewController {
    
    private func prepareStartupAnimation() {
        self.logoImageView.transform = .identity
        self.startButton.alpha = 0.0
        self.startButton.isEnabled = false
        self.helpButton.alpha = 0.0
        self.helpButton.isEnabled = false
    }
    
    private func startupAnimation() {
        self.prepareStartupAnimation()
        
        let timingParameters = UISpringTimingParameters(damping: 0.5, response: 1.0)
        let startupAnimator: UIViewPropertyAnimator = UIViewPropertyAnimator(duration: 0.0, timingParameters: timingParameters)
        
        startupAnimator.addAnimations {
            self.logoImageView.transform = CGAffineTransform(translationX: 0.0, y: -60.0)
            self.startButton.alpha = 1.0
            self.helpButton.alpha = 1.0
        }
        
        startupAnimator.addCompletion { _ in
            self.startButton.isEnabled = true
            self.helpButton.isEnabled = true
            
            self.startupAnimation()
        }
        
        startupAnimator.startAnimation()
    }
    
}

// MARK: - Module functions
extension MainViewController { }
