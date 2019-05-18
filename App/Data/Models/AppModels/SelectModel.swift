//
//  SelectModel.swift
//  Amaki
//
//  Created by Victor Catão on 23/04/19.
//  Copyright © 2019 Catao. All rights reserved.
//

import Foundation

class SelectModel {
    var id: String?
    var isSelected: Bool = false
    var name: String?
    
    init(id: String?, isSelected: Bool, name: String?) {
        self.id = id
        self.isSelected = isSelected
        self.name = name
    }
    
}
