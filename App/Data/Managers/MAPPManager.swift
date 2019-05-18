//
//  MAPPManager.swift
//  Catao
//
//  Created by Victor Catão on 30/12/18.
//  Copyright © 2018 Catao. All rights reserved.
//

import Foundation

class MAPPManager: APIManager {
    
    static func signIn(request: LoginRequest, success: ((UserResponse) -> Void)?, error: ((String, Int) -> Void)? ){
//        postToAPIService(service: POST_LOGIN, params: (request.toDictionary() as? [String : Any]), success: { (response) in
//            let user = UserResponse(json: response)
//            UserDefaults.standard.set(user.token, forKey: KEY_USER_TOKEN)
//            
//            success?(user)
//            
//        }) { (err, statusCode) in
//            error?(err, statusCode)
//        }
    }
    
}
