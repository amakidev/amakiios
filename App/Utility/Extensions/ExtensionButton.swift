//
//  ExntensionButton.swift
//  Catao
//
//  Created by Victor Catão on 05/11/18.
//  Copyright © 2018 Catao. All rights reserved.
//

import UIKit

extension UIButton: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            setTitle(key?.localized, for: .normal)
        }
    }
}
