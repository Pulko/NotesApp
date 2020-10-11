//
//  NoteCell.swift
//  Notes
//
//  Created by Фёдор Ткаченко on 27.09.20.
//

import Foundation
import SwiftUI

struct NoteCell: View {
	var note: UserNote
	
	func noteIcon() -> String {
		note.isDone ? "largecircle.fill.circle" : "circle"
	}
	
	func noteContent(_ content: Array<UserNoteContent>) -> Text {
		if (content.isEmpty) {
			return Text("")
		} else {
			return Text(content[0].row)
		}
	}

	var body: some View {
		HStack{
			HStack {
				Image(systemName: noteIcon())
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 30.0, height: 30.0)
					.foregroundColor(.green)
					.onTapGesture {
						toggleNote(note.id)
					}
			}
			.frame(width: 60.0, height: 60.0)
			
			VStack(alignment: .leading) {
				formatNoteTitle(Text(note.title))
				formatNoteContent(noteContent(note.content))
					.frame(maxWidth: 250.0)
					.lineLimit(1)
			}
		}
	}
}

struct NoteCell_Previews: PreviewProvider {
	static var previews: some View {
		NoteCell(note: noteStore.notes[0])
	}
}
