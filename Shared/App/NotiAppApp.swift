//
//  NotiAppApp.swift
//  Shared
//
//  Created by Ian Alexandro on 16/03/21.
//

import SwiftUI

@main
struct NotiAppApp: App {
    
    let cntx = PersistentCloudKitContainer.persistentContainer.viewContext
    
    var body: some Scene {
        WindowGroup {
            HomeView().environment(\.managedObjectContext, cntx)
        }
    }
    
}
