import Foundation

class NoteStore: ObservableObject {
	@Published var notes: Array<UserNote>
	
	init(notes: Array<UserNote>) {
		self.notes = notes
	}
	
	func addNote(_ note: UserNote) {
		notes.append(note)
	}
	
	func toggleNote(_ id: UUID) {
		let noteIndex = notes.firstIndex(where: {$0.id == id})
		let currentCheck = notes[noteIndex!].isDone
		
		notes[noteIndex!].isDone = !currentCheck
	}
	
	func removeNote(_ id: UUID) {
		let index: Int! = notes.firstIndex(where: {$0.id == id}) ?? nil
		
		if (index != nil) {
			notes.remove(at: index)
		}
	}
}

let noteStore: NoteStore = NoteStore(notes: testData)

let toggleNote = {(_ id: UUID) -> Void in
	noteStore.toggleNote(id)
}

let addNewNote = {(_ note: UserNote) -> Void in
	noteStore.addNote(note)
}

let removeNote = {(_ id: UUID) -> Void in
	noteStore.removeNote(id)
}

