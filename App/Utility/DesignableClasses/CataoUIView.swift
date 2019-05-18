//
//  CataoUIView.swift
//  Catao
//
//  Created by Catao on 21/12/2017.
//  Copyright © 2017 Catao. All rights reserved.
//

import UIKit

@IBDesignable class CataoUIView: UIView {
    
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
