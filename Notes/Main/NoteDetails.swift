//
//  NoteDetails.swift
//  Notes
//
//  Created by Фёдор Ткаченко on 27.09.20.
//

import Foundation
import SwiftUI

struct NoteDetails: View {
	var note: UserNote

	var body: some View {
		Text(note.content)
	}
}

struct NoteDetails_Previews: PreviewProvider {
	static var previews: some View {
		NoteDetails(note: noteStore.notes[0])
	}
}
