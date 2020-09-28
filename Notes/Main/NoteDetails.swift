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
	var onTap: (() -> Void)!
	
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
			.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
			GroupBox {
				contentFormatter(Text(note.content))
					
			}
			.frame(maxWidth: 320)
			.rotation3DEffect(Angle(degrees: 5), axis: (x: 10.0, y: 10.0, z: 5.0))
			
			Spacer(minLength: 60)
			Button("Back") {
				onTap()
			}
			.frame(width: 150.0, height: 50.0)
			.foregroundColor(Color.black)
			Spacer(minLength: 100)
		}
	}
}

func contentFormatter(_ view: Text) -> some View {
	view
		.font(.subheadline)
		.fontWeight(.semibold)
		.padding(.all, 30.0)
}

struct NoteDetails_Previews: PreviewProvider {

	static var previews: some View {
		NoteDetails(note: noteStore.notes[0])
	}
}
