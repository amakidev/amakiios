//
//  ExtensionLabel.swift
//
//  Created by Catao on 19/01/2018.
//  Copyright © 2018 Catao. All rights reserved.
//

import UIKit

extension UILabel {
    
    func colorString(text: String?, coloredText: String?, isColoredTextBold: Bool?, color: UIColor? = .orange, colorBase: UIColor? = .darkGray) {
        
        let attributedString = NSMutableAttributedString(string: text!)
        attributedString.setAttributes([NSAttributedStringKey.foregroundColor: colorBase!], range: (text! as NSString).range(of: text!))
        
        let range = (text! as NSString).range(of: coloredText!)
        attributedString.setAttributes([NSAttributedStringKey.foregroundColor: color!],
                                       range: range)
        if(isColoredTextBold == true) {
            attributedString.addAttributes([NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: self.font.pointSize)],
                                           range: range)
        }
        self.attributedText = attributedString
    }
    
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.styleSingle.rawValue,
                                          range: NSRange(location: 0, length: textString.count))
            self.attributedText = attributedString
        }
    }
    
}

extension UILabel: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            text = key?.localized
        }
    }
}
