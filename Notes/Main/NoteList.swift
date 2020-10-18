import Foundation
import SwiftUI

struct NoteList: View {
	var notes: Array<UserNote>
    
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack {
				ForEach(notes) { note in
					GroupBox {
						NavigationLink(destination: NoteDetails(note: note)) {
							NoteCell(note: note)
						}
					}
				}
			}
		}
	}
}

struct NoteList_Previews: PreviewProvider {
	static var previews: some View {
		NoteList(notes: noteStore.notes)
	}
}
