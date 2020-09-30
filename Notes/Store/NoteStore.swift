//
//  NoteStore.swift
//  Notes
//
//  Created by Фёдор Ткаченко on 27.09.20.
//

import Foundation

class NoteStore: ObservableObject {
	@Published var notes: Array<UserNote>
	
	init(notes: Array<UserNote>) {
		self.notes = notes
	}
	
	func addNote(note: UserNote) {
		notes.append(note)
	}
	
	func toggleNote(id: UUID) {
		let noteIndex = notes.firstIndex(where: {$0.id == id})
		let currentCheck = notes[noteIndex!].isDone
		
		notes[noteIndex!].isDone = !currentCheck
	}
}

let noteStore: NoteStore = NoteStore(notes: testData)

let toggleNote = {(_ id: UUID) -> Void in
	noteStore.toggleNote(id: id)
}

let addNote = {(_ note: UserNote) -> Void in
	noteStore.addNote(note: note)
}
