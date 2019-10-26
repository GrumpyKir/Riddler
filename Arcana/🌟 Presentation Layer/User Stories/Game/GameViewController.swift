//
//  GameViewController.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol GameViewInput: ViperViewInput {
    func updateQuestion(title: String)
}

protocol GameViewOutput: ViperViewOutput {
    func loadNextQuestion()
}

class GameViewController: ViperViewController, GameViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var backgroundImageView: UIImageView!
    
    @IBOutlet private weak var pointsLabel: UILabel!
    
    @IBOutlet private weak var closeBackgroundView: UIView!
    @IBOutlet private weak var closeImageView: UIImageView!
    @IBOutlet private weak var closeLabel: UILabel!
    @IBOutlet private weak var closeButton: UIButton!
    
    @IBOutlet private weak var questionCardView: UIView!
    @IBOutlet private weak var questionTitle: UILabel!
    
    @IBOutlet private weak var nextButton: UIButton!
    
    // MARK: - Props
    fileprivate var output: GameViewOutput? {
        guard let output = self._output as? GameViewOutput else { return nil }
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
        self.navigationItem.title = GameLocalization.navigationTitle.localized
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.backgroundImageView.image = AppAssets.appBackground
        
        self.pointsLabel.text = "65 баллов"
        self.closeLabel.text = "Завершить"
        self.questionTitle.text = ""
        self.nextButton.setTitle("Следующая загадка", for: [])
    }
    
    func setupActions() {
        self.nextButton.addTarget(self, action: #selector(self.nextButtonTapped(_:)), for: .touchUpInside)
        self.closeButton.addTarget(self, action: #selector(self.closeButtonTapped(_:)), for: .touchUpInside)
    }
    
    func applyStyles() {
        self.view.apply(.backgroundClearStyle())
        self.backgroundImageView.apply(.generalFillStyle())
        
        self.pointsLabel.apply(.pointsTitleStyle())
        
        self.closeBackgroundView.apply(.backBackgrondStyle())
        self.closeImageView.apply(.closeImageStyle())
        self.closeLabel.apply(.closeTitleStyle())
        self.closeButton.apply(.closeButtonStyle())
        
        self.questionCardView.apply(.questionCardStyle())
        self.questionTitle.apply(.questionTitleStyle())
        
        self.nextButton.apply(.nextButtonStyle())
    }
    
    // MARK: - GameViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
    func updateQuestion(title: String) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            
            strongSelf.questionTitle.text = title
        }
    }
    
}

// MARK: - Actions
extension GameViewController {
    
    @objc
    private func nextButtonTapped(_ sender: UIButton) {
        self.output?.loadNextQuestion()
        
        self.nextCardAnimation()
    }
    
    @objc
    private func closeButtonTapped(_ sender: UIButton) {
        self.output?.close(animated: true)
    }
    
}

// MARK: - Animations
extension GameViewController {
    
    private func prepareStartupAnimation() {
        self.pointsLabel.alpha = 0.0
        self.closeBackgroundView.alpha = 0.0
        
        let horizontalTransition = self.questionCardView.bounds.width * 1.5
        self.questionCardView.transform = CGAffineTransform(translationX: -horizontalTransition, y: 0.0)
    }
    
    private func startupAnimation() {
        self.prepareStartupAnimation()
        
        let timingParameters = UISpringTimingParameters(damping: 0.85, response: 0.35)
        let startupAnimator: UIViewPropertyAnimator = UIViewPropertyAnimator(duration: 0.0, timingParameters: timingParameters)

        startupAnimator.addAnimations {
            self.pointsLabel.alpha = 1.0
            self.closeBackgroundView.alpha = 1.0
            self.questionCardView.transform = .identity
            self.questionCardView.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -0.1...0.1))
        }

        startupAnimator.addCompletion { _ in
            //
        }

        startupAnimator.startAnimation()
    }
    
    func nextCardAnimation() {
        let timingParameters = UISpringTimingParameters(damping: 0.85, response: 0.35)
        let horizontalTransition = self.questionCardView.bounds.width * 1.5
        
        let fadeAnimator: UIViewPropertyAnimator = UIViewPropertyAnimator(duration: 0.0, timingParameters: timingParameters)

        fadeAnimator.addAnimations {
            self.questionCardView.transform = CGAffineTransform(translationX: horizontalTransition, y: 0.0)
        }

        fadeAnimator.addCompletion { _ in
            self.questionCardView.transform = CGAffineTransform(translationX: -horizontalTransition, y: 0.0)
            
            let showAnimator: UIViewPropertyAnimator = UIViewPropertyAnimator(duration: 0.0, timingParameters: timingParameters)
            
            showAnimator.addAnimations {
                self.questionCardView.transform = .identity
                self.questionCardView.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -0.1...0.1))
            }
            
            showAnimator.addCompletion { _ in
                //
            }
            
            showAnimator.startAnimation()
        }

        fadeAnimator.startAnimation()
    }
    
}

// MARK: - Module functions
extension GameViewController { }
