//
//  EstablishmentManager.swift
//  Amaki
//
//  Created by Victor Catão on 21/04/19.
//  Copyright © 2019 Catao. All rights reserved.
//

import Foundation

class EstablishmentManager: APIManager {
    
    static func getStatesAndCities(success: (([CityStateResponse]) -> Void)?, error: ((String, Int) -> Void)? ){
        getToAPIService(service: GET_STATES_AND_CITIES, params: nil, success: { (response) in
            success?([CityStateResponse](json: response))
        }) { (err, statusCode) in
            error?(err, statusCode)
        }
    }
    
    
    static func getEstablishments(request: GetEstablishmentsRequest, success: (([EstablishmentResponse]) -> Void)?, error: ((String, Int) -> Void)? ){
        postToAPIService(service: GET_ESTABLISHMENTS, params: (request.toDictionary() as? [String : Any]), success: { (response) in
            success?([EstablishmentResponse](json: response))
        }) { (err, statusCode) in
            error?(err, statusCode)
        }
    }
    
    
    static func getAboutAmaki(success: ((AboutAmakiResponse) -> Void)?, error: ((String, Int) -> Void)? ){
        getToAPIService(service: GET_ABOUT_AMAKI, params: nil, success: { (response) in
            success?(AboutAmakiResponse(json: response))
        }) { (err, statusCode) in
            error?(err, statusCode)
        }
    }
    
}
