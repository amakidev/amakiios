//
//  CataoUIButton.swift
//  Dev
//
//  Created by Catao on 22/12/2017.
//  Copyright © 2017 Catao. All rights reserved.
//

import UIKit

class CataoUIButton: UIButton {
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
}

