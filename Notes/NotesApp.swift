import SwiftUI
import CoreData

@main
struct NotesApp: App {
	@StateObject private var store: NoteStore = noteStore

	var body: some Scene {
		WindowGroup {
			ContentView(store: noteStore)
		}
	}
}
