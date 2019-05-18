//
//  CreateAccountRequest.swift
//  Catao
//
//  Created by Victor Catão on 31/12/18.
//  Copyright © 2018 Catao. All rights reserved.
//

import Foundation

class CreateAccountRequest: CataoModel {
    var matricula: String?
    var ordem: String?
    var cpf: String?
    var contrato: String?
    var email: String?
    var nome: String?
    var ddd: String?
    var celular: String?
    var validadeCarterinha: String?
    var senha: String?
    var aceiteTermo: String?
    var dtaNasc: String?
    var metodo: String?
    var avatar: String?
    var validacao: Bool?
}
