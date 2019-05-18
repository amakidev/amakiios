//
//  MedicalGuideRequest.swift
//  Policlin
//
//  Created by Victor Catão on 06/01/19.
//  Copyright © 2019 Victor Catao. All rights reserved.
//

import Foundation

class MedicalGuideRequest: CataoModel {
    var codigo_Plano: String?
    var codigo_Cidade: String?
    var FilAvanc_TipoServico: String?
    var codigo_Especialidade_Servico: String?
    var RedePropria: String?
    var locLatitude: String?
    var locLongitude: String?
    var FilAvanc_Endereco: String?
    var FilAvanc_Bairro: String?
    var FilAvanc_CEP: String?
    var FilAvanc_ClasseProfissional: String?
    var FilAvanc_NumeroConselho: String?
    var FilAvanc_NomeProfissional_NomeFantasia_RazaoSocial: String?
    var FilAvanc_CNPJ: String?
    var FilAvanc_Telefone: String?
    var FilAvanc_TipoEstabelecimentoCNES: String?
    var FilAvanc_Qualificacoes: String?
    var Ent_Tipo: String?
}
