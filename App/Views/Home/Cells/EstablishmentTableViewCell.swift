//
//  EstablishmentTableViewCell.swift
//  Base
//
//  Created by Victor Catão on 21/04/19.
//  Copyright © 2019 Catao. All rights reserved.
//

import UIKit

class EstablishmentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var pictureImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var discountImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(establishment: EstablishmentResponse) {
        pictureImageView.setImage(imageURL: establishment.picture)
        nameLabel.text = establishment.name
        addressLabel.text = establishment.address
        
        if let arr = establishment.categories?.filter({$0.name != nil}).map({ $0.name! }) {
            categoriesLabel.text = arr.joined(separator: ", ")
        }
        
        distanceLabel.isHidden = establishment.distance == nil
        if let distance = establishment.distance {
            distanceLabel.text = "\(String.init(format: "%.2f", distance.floatValue))km"
        }
        
        discountImageView.isHidden = establishment.hasDiscount?.boolValue == false
    }
    
}
