//
//  SelectTableViewCell.swift
//  Amaki
//
//  Created by Victor Catão on 24/04/19.
//  Copyright © 2019 Catao. All rights reserved.
//

import UIKit

class SelectTableViewCell: UITableViewCell {

    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(item: SelectModel) {
        self.nameLabel.text = item.name
        self.checkImageView.image = item.isSelected ? UIImage(named: "ic_check_selected") : UIImage(named: "ic_check")
    }
    
}
