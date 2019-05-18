//
//  CheckboxButton.swift
//  Catao
//
//  Created by Victor Catão on 31/12/18.
//  Copyright © 2018 Catao. All rights reserved.
//

import UIKit

class CheckboxButton: UIButton {

    override func draw(_ rect: CGRect) {
        self.setBackgroundImage(UIImage(named:"ic_checkbox_empty"), for: .normal)
        self.setBackgroundImage(UIImage(named:"ic_checkbox_filled"), for: .selected)
        self.setTitle("", for: .selected)
        self.tintColor = UIColor.clear
        
        self.addTarget(self, action: #selector(didClick), for: .touchUpInside)
    }
    
    @objc func didClick() {
        self.isSelected = !(self.isSelected)
    }
    
}
