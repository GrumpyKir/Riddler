//
//  CategoryCell.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKRepresentable

class CategoryCell: TableCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var categoryBackgroundView: UIView!
    
    @IBOutlet private weak var selectedView: UIView!
    @IBOutlet private weak var selectedCenterView: UIView!
    
    @IBOutlet private weak var categoryTitleLabel: UILabel!
    
    // MARK: - Prors
    
    // MARK: - Setup functions
    override func setupView() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        self.categoryBackgroundView.backgroundColor = AppTheme.backgroundControl(alpha: 0.3)
        self.categoryBackgroundView.layer.cornerRadius = 6.0
        self.categoryBackgroundView.layer.masksToBounds = true
        
        self.selectedView.backgroundColor = AppTheme.backgroundContent()
        self.selectedView.layer.cornerRadius = 3.0
        self.selectedView.layer.masksToBounds = true
        
        self.selectedCenterView.backgroundColor = AppTheme.accentMain
        self.selectedCenterView.layer.cornerRadius = 3.0
        self.selectedCenterView.layer.masksToBounds = true
        
        self.categoryTitleLabel.font = FiraSans.regular.font(size: 16.0)
        self.categoryTitleLabel.textAlignment = .left
        self.categoryTitleLabel.numberOfLines = 1
    }
    
    override func updateViews() {
        guard let model = self.model as? CategoryCellModel else { return }
        
        self.categoryTitleLabel.text = model.category.name
        
        if model.isSelected {
            self.selectedCenterView.alpha = 1.0
            self.categoryTitleLabel.textColor = AppTheme.textMain
        } else {
            self.selectedCenterView.alpha = 0.0
            self.categoryTitleLabel.textColor = AppTheme.textSub
        }
    }
    
    override open func setHighlighted(_ highlighted: Bool, animated: Bool) { }
    
    // MARK: - Actions
}
