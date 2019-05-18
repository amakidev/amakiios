//
//  UserResponse.swift
//  Catao
//
//  Created by Catao on 18/12/2017.
//  Copyright © 2017 Catao. All rights reserved.
//

import UIKit
import EVReflection

class UserResponse: CataoModel {
//    var token: String?
    var inf: Inf?
    var codAcao: Int?
    var msgInterna, msgExterna: String?
    
}

class Inf: CataoModel {
    var nome, contrato, cpf, dtaNasc: String?
    var ddd, celular, email, validadeCarterinha: String?
    var codigoPlano, descricaoPlano: String?
    var matricula, ordem: Int?
    var foto_Perfil: String?
    var codAcao: Int?
    var msgInterna, msgExterna: String?
    
}
