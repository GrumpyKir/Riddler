//
//  CategoriesViewController.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol CategoriesViewInput: ViperViewInput { }

protocol CategoriesViewOutput: ViperViewOutput { }

class CategoriesViewController: ViperViewController, CategoriesViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var backgroundGradientView: UIVisualEffectView!
    @IBOutlet private weak var backgroundView: UIView!
        
    @IBOutlet private weak var backBackgroundView: UIView!
    @IBOutlet private weak var backImageView: UIImageView!
    @IBOutlet private weak var backLabel: UILabel!
    @IBOutlet private weak var backButton: UIButton!
    
    @IBOutlet private weak var categoriesBackgroundView: UIView!
    @IBOutlet private weak var categoriesTitleLabel: UILabel!
    @IBOutlet private weak var categoriesTableView: UITableView!
    
    @IBOutlet private weak var startButton: UIButton!
    
    // MARK: - Props
    fileprivate var output: CategoriesViewOutput? {
        guard let output = self._output as? CategoriesViewOutput else { return nil }
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
        self.navigationItem.title = CategoriesLocalization.navigationTitle.localized
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.backLabel.text = CategoriesLocalization.backTitle.localized
        self.categoriesTitleLabel.text = CategoriesLocalization.categoryTitle.localized
        
        self.startButton.setTitle(CategoriesLocalization.startTitle.localized, for: [])
    }
    
    func setupActions() {
        self.backButton.addTarget(self, action: #selector(self.backButtonTapped(_:)), for: .touchUpInside)
    }
    
    func applyStyles() {
        self.view.apply(.backgroundClearStyle())
        self.backgroundGradientView.apply(.blurBackgroundStyle())
        self.backgroundView.apply(.backgrondStyle())
        
        self.backBackgroundView.apply(.backBackgrondStyle())
        self.backImageView.apply(.backImageStyle())
        self.backLabel.apply(.backTitleStyle())
        self.backButton.apply(.backButtonStyle())
        
        self.categoriesBackgroundView.apply(.categoriesBackgroundStyle())
        self.categoriesTitleLabel.apply(.categoriesTitleStyle())
        self.categoriesTableView.apply(.categoriesTableViewStyle())
        
        self.startButton.apply(.startButtonStyle())
    }
    
    // MARK: - CategoriesViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension CategoriesViewController {
    
    @objc
    private func backButtonTapped(_ sender: UIButton) {
        self.output?.close(animated: true)
    }
    
}

// MARK: - Animations
extension CategoriesViewController {
    
    private func prepareStartupAnimation() {
        self.backBackgroundView.alpha = 0.0
        let verticalTransition = self.categoriesBackgroundView.bounds.height
        self.categoriesBackgroundView.transform = CGAffineTransform(translationX: 0.0, y: verticalTransition)
    }
    
    private func startupAnimation() {
        self.prepareStartupAnimation()
        
        let timingParameters = UISpringTimingParameters(damping: 0.85, response: 0.5)
        let startupAnimator: UIViewPropertyAnimator = UIViewPropertyAnimator(duration: 0.0, timingParameters: timingParameters)
        
        startupAnimator.addAnimations {
            self.backBackgroundView.alpha = 1.0
            self.categoriesBackgroundView.transform = .identity
        }
        
        startupAnimator.addCompletion { _ in
            //
        }
        
        startupAnimator.startAnimation()
    }
    
}

// MARK: - Module functions
extension CategoriesViewController { }
