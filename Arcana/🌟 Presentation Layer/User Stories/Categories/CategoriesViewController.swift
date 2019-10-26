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
    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var categoriesTableView: UITableView!
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var closeButton: UIButton!
    
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
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = CategoriesLocalization.navigationTitle.localized
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setupActions() {
        self.closeButton.addTarget(self, action: #selector(self.closeButtonTapped(_:)), for: .touchUpInside)
    }
    
    func applyStyles() {
        self.view.apply(.backgroundClearStyle())
        self.backgroundView.apply(.categoriesBackgroundStyle())
        let topInset = self.closeButton.bounds.height + 8.0
        let bottomInset = self.startButton.bounds.height + 8.0
        self.categoriesTableView.apply(.categoriesTableViewStyle(topInset: topInset, bottomInset: bottomInset))
        self.startButton.apply(.startButtonStyle())
        self.closeButton.apply(.closeButtonStyle())
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
    private func closeButtonTapped(_ sender: UIButton) {
        self.output?.close(animated: true)
    }
    
}

// MARK: - Module functions
extension CategoriesViewController { }
