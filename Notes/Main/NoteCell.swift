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
					.lineLimit(1)
			}
			Spacer()
			HStack {
				Image(systemName: "trash")
					.foregroundColor(.black)
					.onTapGesture {
						removeNote(note.id)
					}
			}
			.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
		}
	}
}

struct NoteCell_Previews: PreviewProvider {
	static var previews: some View {
		NoteCell(note: noteStore.notes[3])
	}
}
