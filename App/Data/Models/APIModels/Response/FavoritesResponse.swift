//
//  FavoritesResponse.swift
//  Policlin
//
//  Created by Victor Catão on 10/01/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation

class FavoritesResponse: CataoModel {
    var lista: [InfFavorite]?
}

class InfFavorite: CataoModel {
    var inf: MedicalGuide?
}


