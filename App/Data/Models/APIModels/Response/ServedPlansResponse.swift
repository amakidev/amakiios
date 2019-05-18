//
//  ServedPlansResponse.swift
//  Policlin
//
//  Created by Victor Catão on 10/01/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation

class ServedPlansResponse: CataoModel {
    var lista: [DescriptionModel]?
}

class DescriptionModel: CataoModel {
    var desc: String?
}
