//
//  CategoryManager.swift
//  Amaki
//
//  Created by Victor Catão on 21/04/19.
//  Copyright © 2019 Catao. All rights reserved.
//

import Foundation

class CategoryManager: APIManager {
    
    static func getCategories(success: (([CategoryResponse]) -> Void)?, error: ((String, Int) -> Void)? ){
        getToAPIService(service: GET_CATEGORIES, params: nil, success: { (response) in
            success?([CategoryResponse](json: response))
        }) { (err, statusCode) in
            error?(err, statusCode)
        }
    }
    
}
