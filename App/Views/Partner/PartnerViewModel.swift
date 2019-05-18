//
//  PartnerViewModel.swift
//  Project
//
//  Created by Victor Catão on 28/04/19.
//  Copyright (c) 2019 Catao. All rights reserved.
//

import UIKit

class PartnerViewModel {
    
    let req = ContactRequest()
    
    func validate(name: String?,
                  phone: String?,
                  establishmentName: String?,
                  address: String?,
                  socialNetwork: String?,
                  email: String?,
                  description: String?) -> (valid: Bool, message: String) {
        
        guard let nameStr = name, name != "" else {return (false, "Preencha o nome")}
        guard let phoneStr = phone, phoneStr != "" else {return (false, "Preencha o telefone")}
        guard let establishmentNameStr = establishmentName, establishmentNameStr != "" else {return (false, "Preencha o nome do estabelecimento")}
        guard let addressStr = address, addressStr != "" else {return (false, "Preencha o endereço")}
        guard let emailStr = email, emailStr != "" else {return (false, "Preencha o e-mail")}
        guard let descriptionStr = description, descriptionStr != "" else {return (false, "Preencha o que você oferece")}
        
        
        req.name = nameStr
        req.phone = phoneStr
        req.establishment_name = establishmentNameStr
        req.address = addressStr
        req.email = emailStr
        req.socialNetwork = socialNetwork
        req.desc =  descriptionStr
        
        return (true, "")
    }
    
    func createContact(success: @escaping()->(), error: @escaping (String)->()) {
        ContactManager.createContact(request: req, success: {
            success()
        }) { (msg, status) in
            error(msg)
        }
    }
    
}
