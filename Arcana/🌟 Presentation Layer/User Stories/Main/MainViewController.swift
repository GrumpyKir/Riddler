//
//  MainViewController.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol MainViewInput: ViperViewInput { }

protocol MainViewOutput: ViperViewOutput {
    func goToCategories()
}

class MainViewController: ViperViewController, MainViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var logoImageView: UIImageView!
    
    @IBOutlet private weak var progressBackgroundView: UIView!
    @IBOutlet private weak var progressTitleLabel: UILabel!
    @IBOutlet private weak var progressView: UIProgressView!
    @IBOutlet private weak var progressHintLabel: UILabel!
    
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var settingsButton: UIButton!
    @IBOutlet private weak var helpButton: UIButton!
    
    // MARK: - Props
    fileprivate var output: MainViewOutput? {
        guard let output = self._output as? MainViewOutput else { return nil }
        return output
    }
    
    // MARK: - Lifecycle
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.startupAnimation()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = MainLocalization.navigationTitle.localized
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                
        self.backgroundImageView.image = AppAssets.appBackground
        self.logoImageView.image = AppAssets.appLogo
    }
    
    func setupActions() {
        self.startButton.addTarget(self, action: #selector(self.startButtonTapped(_:)), for: .touchUpInside)
        self.settingsButton.addTarget(self, action: #selector(self.settingsButtonTapped(_:)), for: .touchUpInside)
        self.helpButton.addTarget(self, action: #selector(self.helpButtonTapped(_:)), for: .touchUpInside)
    }
    
    func applyStyles() {
        self.view.apply(.backgroundViewStyle())
        self.backgroundImageView.apply(.generalFillStyle())
        
        self.logoImageView.apply(.generalFillStyle())
        
        self.progressBackgroundView.apply(.backgroundClearStyle())
        
        self.startButton.apply(.categoriesButtonStyle())
        self.settingsButton.apply(.settingsButtonStyle())
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
extension MainViewController {
    
    @objc
    private func startButtonTapped(_ sender: UIButton) {
        self.output?.goToCategories()
    }
    
    @objc
    private func settingsButtonTapped(_ sender: UIButton) {
        //
    }
    
    @objc
    private func helpButtonTapped(_ sender: UIButton) {
        //
    }
    
}

// MARK: - Animations
extension MainViewController {
    
    private func prepareStartupAnimation() {
        self.logoImageView.transform = .identity
        self.startButton.alpha = 0.0
        self.startButton.isEnabled = false
        self.helpButton.alpha = 0.0
        self.helpButton.isEnabled = false
        self.settingsButton.alpha = 0.0
        self.settingsButton.isEnabled = false
    }
    
    private func startupAnimation() {
        self.prepareStartupAnimation()
        
        let timingParameters = UISpringTimingParameters(damping: 0.5, response: 1.0)
        let startupAnimator: UIViewPropertyAnimator = UIViewPropertyAnimator(duration: 0.0, timingParameters: timingParameters)
        
        startupAnimator.addAnimations {
            let verticalTransition = self.view.bounds.height * 0.25
            self.logoImageView.transform = CGAffineTransform(translationX: 0.0, y: -verticalTransition)
            self.startButton.alpha = 1.0
            self.helpButton.alpha = 1.0
            self.settingsButton.alpha = 1.0
        }
        
        startupAnimator.addCompletion { _ in
            self.startButton.isEnabled = true
            self.helpButton.isEnabled = true
            self.settingsButton.isEnabled = true
        }
        
        startupAnimator.startAnimation()
    }
    
}

// MARK: - Module functions
extension MainViewController { }
