//
//  EstablishmentViewModel.swift
//  Project
//
//  Created by Victor Catão on 22/04/19.
//  Copyright (c) 2019 Catao. All rights reserved.
//

import UIKit

class EstablishmentViewModel {
    
    // MARK: - Variables
    var establishment: EstablishmentResponse!
    private let latSP: Double = -23.563286
    private let lngSP: Double = -46.654178
    
    // MARK: - Infos
    func getLatLng() -> (Double, Double) {
        return (self.establishment.latitude?.doubleValue ?? latSP, self.establishment.longitude?.doubleValue ?? lngSP)
    }
    
    func getName() -> String? {
        return self.establishment.name
    }
    
    func getAddress() -> String? {
        return self.establishment.address
    }
    
    func getDescription() -> String? {
        return self.establishment.desc
    }
    
    func getDistance() -> String? {
        guard let distance = self.establishment.distance else { return nil }
        return String(format: "%.2f", distance.floatValue)
    }
    
    func getfacebook() -> String? {
        return self.establishment.facebook
    }
    
    func getinstagram() -> String? {
        return self.establishment.instagram
    }
    
    func getwebsite() -> String? {
        return self.establishment.site
    }
    
    func getwhatsapp() -> String? {
        return self.establishment.cellphone
    }
    
    func getphone() -> String? {
        return self.establishment.phone
    }
    
    func hasDiscount() -> Bool {
        return self.establishment.hasDiscount?.boolValue == true
    }
    
    func isWhatsApp() -> Bool {
        return self.establishment.isWhatsApp?.boolValue == true
    }
    
    
    
    // MARK: - hidden
    func distanceIsHidden() -> Bool {
        return self.establishment.distance == nil
    }
    
    func facebookIsHidden() -> Bool {
        return self.establishment.facebook == nil || self.establishment.facebook == ""
    }
    
    func instagramIsHidden() -> Bool {
        return self.establishment.instagram == nil || self.establishment.instagram == ""
    }
    
    func websiteIsHidden() -> Bool {
        return self.establishment.site == nil || self.establishment.site == ""
    }
    
    func whatsappIsHidden() -> Bool {
        return self.establishment.cellphone == nil || self.establishment.cellphone == ""
    }
    
    func phoneIsHidden() -> Bool {
        return self.establishment.phone == nil || self.establishment.phone == ""
    }
    
    
    
    
    
    
    
    
    
    
}
