//
//  Colors.swift
//  Catao
//
//  Created by Catao on 18/12/2017.
//  Copyright © 2017 Catao. All rights reserved.
//

import UIKit

class Colors {
    
    static let MAIN_COLOR = UIColorFromRGB(rgbValue: 0xF2B110)
    static let MODAL_SHADOW_COLOR = UIColorFromRGBWithAlpha(rgbValue: 0x000000, alpha: UInt(0.1))
    
    static func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static func UIColorFromRGBWithAlpha(rgbValue: UInt, alpha: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}

