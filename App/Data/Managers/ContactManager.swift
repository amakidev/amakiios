//
//  ContactManager.swift
//  Amaki
//
//  Created by Victor Catão on 28/04/19.
//  Copyright © 2019 Catao. All rights reserved.
//

import Foundation

class ContactManager: APIManager {
    static func createContact(request: ContactRequest, success: (() -> Void)?, error: ((String, Int) -> Void)? ){
        postToAPIService(service: POST_CREATE_CONTACT, params: (request.toDictionary() as? [String : Any]), success: { (response) in
            success?()
        }) { (err, statusCode) in
            error?(err, statusCode)
        }
    }
}
