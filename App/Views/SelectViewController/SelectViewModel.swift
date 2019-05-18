//
//  SelectViewModel.swift
//  Project
//
//  Created by Victor Catão on 23/04/19.
//  Copyright (c) 2019 Catao. All rights reserved.
//

import UIKit

class SelectViewModel {
    
    var items: [SelectModel] = []
    
    func getNumberOfRows() -> Int {
        return self.items.count
    }
    
    func getItem(at index: Int) -> SelectModel {
        return self.items[index]
    }
    
    func select(at index: Int) {
        items.forEach({$0.isSelected = false})
        items[index].isSelected = true
    }
    
    func getSelectedItems() -> [SelectModel] {
        return items.filter({$0.isSelected == true})
    }
    
}
