//
//  EstablishmentResponse.swift
//  Amaki
//
//  Created by Victor Catão on 21/04/19.
//  Copyright © 2019 Catao. All rights reserved.
//

import Foundation

class EstablishmentResponse: CataoModel {
    var categories: [CategoryResponse]?
    var hasDiscount: NSNumber?
    var isWhatsApp: NSNumber?
    var _id: String?
    var address: String?
    var cellphone: String?
    var desc: String?
    var facebook: String?
    var instagram: String?
    var latitude: NSNumber?
    var longitude: NSNumber?
    var name: String?
    var phone: String?
    var site: String?
    var neighborhood: String?
    var picture: String?
    var distance: NSNumber?
}
