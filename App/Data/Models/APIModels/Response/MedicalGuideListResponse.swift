//
//  MedicalGuideListResponse.swift
//  Policlin
//
//  Created by Victor Catão on 07/01/19.
//  Copyright © 2019 Victor Catao. All rights reserved.
//

import Foundation

class MedicalGuideListResponse: CataoModel {
    var planos: [PlanList]?
}

class PlanList: CataoModel {
    var PlanoNome: String?
    var _PlanoCod: String?
    var cidades: [Cities]?
}

class Cities: CataoModel {
    var CidadeNome: String?
    var _CIDCOD: String?
    var tiposervico: [ServiceType]?
}

class ServiceType: CataoModel {
    var TIPOSERV: String?
    var especialidade: [Specialty]?
}

class Specialty: CataoModel {
    var EspecialidadeNome: String?
    var _ESCOD: String?
    var _Ent_Tipo: String?
    var guiamedico: [MedicalGuide]?
}

class MedicalGuide: CataoModel {
    var redePropria: String?
    var nome: String?
    var razao: String?
    var cnpj: String?
    var qualificacao: [QualificationGuide]?
    var tipoEstabelecimento: String?
    var titulo: String?
    var subTitulo: String?
    var especialidade: String?
    var logrodouro: String?
    var numero: String?
    var bairro: String?
    var cep: String?
    var complemento: String?
    var cidade: String?
    var uf: String?
    var telefone1: String?
    var telefone2: String?
    var latitude: String?
    var longitude: String?
    var obs: String?
    var email: String?
    var distancia: String?
    var fotoFachada: String?
    var _Favorito: NSNumber?
    var _SEQ: String?
    var _ORDENACAO: String?
    var _CIDCOD: String?
    var _ESCOD: String?
    var _PlanoCod: String?
    var _PRSCOD: String?
    var _PRSSEQ: String?
    var _PROUF: String?
    var _PROCLS: String?
    var _PROCOD: String?
    var _PROTIT: String?
    var _PROCLN: String?
    var _Tipo: String?
}

class QualificationGuide: CataoModel {
    var imgQualificacao: String?
    var sigla: String?
}
