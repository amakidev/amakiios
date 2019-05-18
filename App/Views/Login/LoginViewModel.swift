//
//  LoginViewModel.swift
//  Catao
//
//  Created by Catao on 19/12/2017.
//  Copyright © 2017 Catao. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    var user: UserResponse?
    
    func isValidLogin(textFields: [CataoTextFieldClass]) -> Bool {
        for tf in textFields {
            tf.validate()
            if tf.isValid() == false {
                return false
            }
        }
        return true
    }
    
    func loginRequest(matricula: String?, ordem: String?, password: String?, success: @escaping ()->(), error: @escaping (String)->()) {
        let req = LoginRequest()
        req.matricula = matricula
        req.ordem = ordem
        req.senha = password
        
        MAPPManager.signIn(request: req, success: { (response) in
            success()
        }) { (msg, status) in
            error(msg)
        }
    }
    
}
