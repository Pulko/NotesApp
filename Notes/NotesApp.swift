//
//  NotesApp.swift
//  Notes
//
//  Created by Фёдор Ткаченко on 27.09.20.
//

import SwiftUI

@main
struct NotesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
