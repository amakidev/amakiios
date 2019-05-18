//
//  CataoUIImageView.swift
//  Catao
//
//  Created by Catao on 21/12/2017.
//  Copyright © 2017 Catao. All rights reserved.
//

import UIKit

@IBDesignable class CataoUIImageView: UIImageView {

    @IBInspectable var isCircular: Bool = false {
        didSet{
            if(isCircular){
                self.layer.cornerRadius = self.frame.width/2
                self.clipsToBounds = true
            }
            else {
                self.layer.cornerRadius = 0
                self.clipsToBounds = false
            }
        }
    }

}
