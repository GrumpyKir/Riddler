//
//  CategoriesViewController.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper
import GKRepresentable
import Spruce

protocol CategoriesViewInput: ViperViewInput {
    func updateForSections(_ sections: [TableSectionModel])
}

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
    
    private var sections: [TableSectionModel] = []
    
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
        
        self.categoriesTableView.dataSource = self
        self.categoriesTableView.delegate = self
        self.categoriesTableView.registerCellNib(CategoryCell.self)
        
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
    
    func updateForSections(_ sections: [TableSectionModel]) {
        self.sections = sections
        
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            
            strongSelf.categoriesTableView.reloadData()
            strongSelf.categoriesTableView.spruce.animate([.slide(.up, .severely), .fadeIn], animationType: SpringAnimation(duration: 0.7), sortFunction: LinearSortFunction(direction: .bottomToTop, interObjectDelay: 0.05))
        }
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

// MARK: - UITableViewDataSource
extension CategoriesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.sections[indexPath.section].rows[indexPath.row]
        
        if model is CategoryCellModel {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier) as? CategoryCell else { return UITableViewCell() }
            cell.model = model
            return cell
        }
        
        return UITableViewCell()
    }
    
}

// MARK: - UITableViewDelegate
extension CategoriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = self.sections[indexPath.section].rows[indexPath.row]
        
        return model.cellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let selectedModel = self.sections[indexPath.section].rows[indexPath.row] as? DiaryWorkoutCellModel else { return }
//        guard let selectedId = selectedModel.userInfo["workoutId"] as? String else { return }
//        let models = self.sections[indexPath.section].rows
//
//        for model in models {
//            guard let diaryWorkoutModel = model as? DiaryWorkoutCellModel else { continue }
//            guard let diaryWorkoutId = diaryWorkoutModel.userInfo["workoutId"] as? String else { return }
//
//            if diaryWorkoutId == selectedId {
//                diaryWorkoutModel.expanded.toggle()
//            } else {
//                diaryWorkoutModel.expanded = false
//            }
//        }
//
//        DispatchQueue.main.async { [weak self] in
//            guard let strongSelf = self else { return }
//
//            if selectedModel.expanded && strongSelf.calendarView.scope == .month {
//                strongSelf.calendarView.setScope(.week, animated: true)
//            }
//
//            strongSelf.tableView.beginUpdates()
//            strongSelf.tableView.endUpdates()
//            tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
//        }
    }
    
}
