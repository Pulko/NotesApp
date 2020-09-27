//
//  NoteList.swift
//  Notes
//
//  Created by Фёдор Ткаченко on 27.09.20.
//

import Foundation
import SwiftUI

struct NoteList: View {
	@State var fullCover: Bool = false
	@State var coverNote: UserNote! = nil

	var notes: Array<UserNote>
    
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack {
				ForEach(notes) { note in
					GroupBox {
						NoteCell(note: note)
					}
					.onTapGesture {
						fullCover.toggle()
						coverNote = note
					}
				}
			}
		}
		.fullScreenCover(isPresented: .constant(fullCover), content: {
			NoteDetails(note: coverNote)
				.onTapGesture {
					fullCover.toggle()
					coverNote = nil
				}
		})
	}
}

struct NoteList_Previews: PreviewProvider {
	static var previews: some View {
		NoteList(notes: noteStore.notes)
	}
}
