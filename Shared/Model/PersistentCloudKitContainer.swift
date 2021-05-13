//
//  PersistentCloudKitContainer.swift
//  NotiApp
//
//  Created by Ian Alexandro on 12/05/21.
//

import SwiftUI
import CoreData

class PersistentCloudKitContainer {
    
    public static var context : NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init () {
        
    }
    
    public static var persistentContainer : NSPersistentContainer {
        
        // let container = NSPersistentContainer(name: "NotiAppModel")
        let container = NSPersistentCloudKitContainer(name: "NotiAppModel")
        
        container.loadPersistentStores(completionHandler: {
            (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Error al cargar las stores \(error), \(error.userInfo)")
            }
        })
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        return container
    }
    
    public static func saveContext() {
        let cntx = persistentContainer.viewContext
        
        if cntx.hasChanges {
            do {
                try cntx.save()
            } catch {
                let nsError = error as NSError
                fatalError("Error al tratar de guardar \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
