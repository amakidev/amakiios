//
//  MedicalGuideResponse.swift
//  Policlin
//
//  Created by Victor Catão on 05/01/19.
//  Copyright © 2019 Victor Catao. All rights reserved.
//

import Foundation

class MedicalGuideFilterResponse: CataoModel {
    var plano: Plano?
    var cidade: Cidade?
    var especialidadeServico: EspecialidadeServico?
    var classeProfissional: ClasseProfissional?
    var tipoServico: TipoServico?
    var tipoEstabelecimento: TipoEstabelecimento?
    var qualificacao: Qualificacao?
    var codAcao: Int?
    var msgInterna, msgExterna: String?
}

class Cidade: CataoModel {
    var lista: [CidadeLista]?
    var codAcao: Int?
    var msgInterna, msgExterna: String?
}

class CidadeLista: CataoModel {
    var codigo_Cidade, descricao_Cidade: String?
}

class ClasseProfissional: CataoModel {
    var lista: [ClasseProfissionalLista]?
}

class ClasseProfissionalLista: CataoModel {
    var Codigo_ClasseProfissional, Descricao_ClasseProfissional: String?
}

class EspecialidadeServico: CataoModel {
    var lista: [EspecialidadeServicoLista]?
    var codAcao: Int?
    var msgInterna, msgExterna: String?
}

class EspecialidadeServicoLista: CataoModel {
    var Codigo_Especialidade_Servicos, Descricao_Especialidade_Servicos: String?
    var Tipo_Especialidade_Servicos: String?
}

class Plano: CataoModel {
    var lista: [PlanoLista]?
    var codAcao: Int?
    var msgInterna, msgExterna: String?
}

class PlanoLista: CataoModel {
    var Codigo_Guia, Codigo_Plano, Descricao_Plano: String?
}

class Qualificacao: CataoModel {
    var lista: [QualificacaoLista]?
}

class QualificacaoLista: CataoModel {
    var imgQualificacao, desc, cod: String?
    var isSelected = false
}

class TipoEstabelecimento: CataoModel {
    var lista: [TipoEstabelecimentoLista]?
}

class TipoEstabelecimentoLista: CataoModel {
    var Codigo_TipoEstabelecimento, Descricao_TipoEstabelecimento: String?
}

class TipoServico: CataoModel {
    var lista: [TipoServicoLista]?
}

class TipoServicoLista: CataoModel {
    var Codigo_TipoServico, Descricao_TipoServico: String?
}
