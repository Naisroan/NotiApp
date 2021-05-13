//
//  Nota.swift
//  NotiApp
//
//  Created by Ian Alexandro on 12/05/21.
//

import CoreData

class Nota: NSManagedObject, Identifiable {
    @NSManaged public var id : UUID
    @NSManaged public var titulo : String
    @NSManaged public var id_categoria : Int32
    @NSManaged public var contenido : String
}
