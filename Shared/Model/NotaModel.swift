//
//  NotaModel.swift
//  NotiApp
//
//  Created by Ian Alexandro on 12/05/21.
//

import SwiftUI

struct Nota : Identifiable
{
    var id = UUID()
    var titulo : String = "Sin título"
    var idCategoria : Int = 0
    var contenido : String = ""
}
