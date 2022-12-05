//
//  Task_1_2App.swift
//  Task 1-2
//
//  Created by Ogabek Matyakubov on 05/12/22.
//

import SwiftUI

@main
struct Task_1_2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
