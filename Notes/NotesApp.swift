//
//  NotesApp.swift
//  Notes
//
//  Created by Фёдор Ткаченко on 27.09.20.
//

import SwiftUI

@main
struct NotesApp: App {
	@StateObject private var store: NoteStore = noteStore

	var body: some Scene {
		WindowGroup {
			ContentView(store: noteStore)
		}
	}
}
