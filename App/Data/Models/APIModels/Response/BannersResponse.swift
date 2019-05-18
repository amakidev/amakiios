//
//  BannersResponse.swift
//  Catao
//
//  Created by Victor Catão on 30/12/18.
//  Copyright © 2018 Catao. All rights reserved.
//

import Foundation

class BannersResponse: CataoModel {
    var lista: [Banner]?
}

class Banner: CataoModel {
    var id: String?
    var imagem: String?
    var url: String?
}
