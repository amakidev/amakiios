//
//  MedicalGuideModel.swift
//  Policlin
//
//  Created by Victor Catão on 20/01/19.
//  Copyright © 2019 Mobile2You. All rights reserved.
//

import Foundation

class MedicalGuideModel: CataoModel {
    var plan: String?
    var city: String?
    var service: String?
    var specialty: String?
    var title: String?
    var subtitle: String?
    var desc: String?
    var distance: String?
    var qualifications: [QualificationGuide]?
    var socialReason: String?
    var cnpj: String?
    var stablishment: String?
    var address: String?
    var cityDetail: String?
    var phone: String?
    var phone1: String?
    var phone2: String?
    var lat: String?
    var long: String?
    var prouf: String?
    var prscod: String?
    var procls: String?
    var procod: String?
    var prsseq: String?
    var escod: String?
    var fotoFachada: String?
    var serviceOrSpecialty: String?
    var isFavorite: Bool = false
    
    var original: MedicalGuide?
}
