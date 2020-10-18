import Foundation
import SwiftUI

struct NoteDetails: View {
	var note: UserNote
	
	func getNoteIcon() -> String {
		note.isDone ? "largecircle.fill.circle" : "circle"
	}
	
	func getIconColor() -> Color {
		note.isDone ? .green : .black
	}

	var body: some View {
		VStack {
			Spacer(minLength: 60)
			HStack {
				Image(systemName: getNoteIcon())
					.foregroundColor(getIconColor())
				
				Text(note.title)
			}
			.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
			.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)

			ForEach(note.content, id: \.id) { (row: UserNoteContent) in
				GroupBox {
					contentFormatter(Text(row.row))
				}
				.frame(maxWidth: 320)
				.rotation3DEffect(
					Angle(
						degrees: Double.random(in: 0..<5)),
						axis: (
							x: CGFloat.random(in: 0..<10),
							y: CGFloat.random(in: 0..<10),
							z: CGFloat.random(in: 0..<5)
						)
				)
			}
			
			
			Spacer(minLength: 60)
			
			Button(note.isDone ? "Incomplete" : "Complete") {
				toggleNote(note.id)
			}
			.padding(10.0)
			.background(note.isDone ? Color.red : Color.green)
			.foregroundColor(.white)
			.font(.title)
			.cornerRadius(8.0)
			.shadow(color: note.isDone ? .red : .green, radius: /*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/)

			Spacer(minLength: 100)
		}
		.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
	}
}

func contentFormatter(_ view: Text) -> some View {
	view
		.font(.subheadline)
		.fontWeight(.semibold)
		.padding(.all, 10.0)
}

struct NoteDetails_Previews: PreviewProvider {

	static var previews: some View {
		NoteDetails(note: noteStore.notes[0])
	}
}
