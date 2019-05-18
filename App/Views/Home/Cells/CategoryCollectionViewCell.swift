//
//  CategoryCollectionViewCell.swift
//  Base
//
//  Created by Victor Catão on 21/04/19.
//  Copyright © 2019 Catao. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlet
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(category: CategoryResponse) {
        self.titleLabel.text = category.name?.uppercased()
        self.titleLabel.textColor = category.isSelected ? .black : .white
    }
    
}
