//
//  CityStateResponse.swift
//  Amaki
//
//  Created by Victor Catão on 21/04/19.
//  Copyright © 2019 Catao. All rights reserved.
//

import Foundation

class CityStateResponse: CataoModel {
    var _id: String?
    var name: String?
    var state_id: StateResponse?
}

class StateResponse: CataoModel {
    var nameShort: String?
}
