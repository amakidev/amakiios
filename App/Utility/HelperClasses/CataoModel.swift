//
//  CataoModel.swift
//  Catao
//
//  Created by Catao on 02/05/2018.
//  Copyright © 2018 Catao. All rights reserved.
//

import Foundation
import EVReflection

class CataoModel: EVNetworkingObject {
    
    var token: String? = UserDefaults.standard.string(forKey: KEY_USER_TOKEN)
    
    override func skipPropertyValue(_ value: Any, key: String) -> Bool {
        if let value = value as? String, value.count == 0 || value == "null" {
            return true
        } else if let value = value as? NSArray, value.count == 0 {
            return true
        } else if value is NSNull {
            return true
        }
        return false
    }
    
}
