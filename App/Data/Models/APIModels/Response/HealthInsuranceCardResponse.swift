//
//  HealthInsuranceCardResponse.swift
//  Policlin
//
//  Created by Victor Catão on 13/01/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation

class HealthInsuranceCardResponse: CataoModel {
    var listaimgFrente: [HealthInsurance]?
    var imgVerso: String?
}

class HealthInsurance: CataoModel {
    var imgFrente: String?
}
