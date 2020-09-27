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
}

let noteStore: NoteStore = NoteStore(notes: testData + testData + testData)
