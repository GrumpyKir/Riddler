//
//  CategoriesPresenter.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper
import GKRepresentable

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
        
        self.interactor?.loadCategories()
    }
    
    func selectCategory(_ category: CategoryModel) {
        if let index = self.viewModel.selectedCategories.firstIndex(where: { $0 == category.identifier }) {
            self.viewModel.selectedCategories.remove(at: index)
        } else {
            self.viewModel.selectedCategories.append(category.identifier)
        }
    }
    
    func startGame() {
        self.view?.show(title: nil, message: "\(self.viewModel.selectedCategories)", animated: true)
    }
    
    // MARK: - CategoriesInteractorOutput
    func provideCategories(_ categories: [CategoryModel]) {
        self.viewModel.categories = categories
        self.viewModel.selectedCategories = []
        
        self.makeSectionsModel(with: categories, selectedCategories: self.viewModel.selectedCategories)
    }
    
    // MARK: - Module functions
    private func makeSectionsModel(with categories: [CategoryModel], selectedCategories: [Int]) {
        let mainSection = TableSectionModel()
        
        for category in categories {
            let categoryRow = CategoryCellModel(category: category)
            categoryRow.isSelected = selectedCategories.contains(category.identifier)
            mainSection.rows.append(categoryRow)
        }
        
        if mainSection.rows.isEmpty {
            self.view?.updateForSections([])
        } else {
            self.view?.updateForSections([mainSection])
        }
    }
}
