import SwiftUI
import CoreData

struct ContentView: View {
	@State var fullCover: Bool = false
	@ObservedObject var store: NoteStore
	
	func onTapGesture() -> Void {
		fullCover.toggle()
	}

	var body: some View {
		NavigationView {
			VStack {
				HStack {
					Text("Notes")
						.font(.title)
					Spacer()
					ToolsView()
						.onTapGesture {
							onTapGesture()
						}
				}

				Spacer(minLength: 20)
				
				HStack {
					if !store.notes.isEmpty {
						NoteList(notes: store.notes)
					} else {
						VStack {
							Spacer()
							Text("Your notes list is empty :(")
								.foregroundColor(.gray)
							Spacer()
						}
					}
				}
			}
			.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
			.navigationBarHidden(true)
			.navigationTitle("My Notes")
			.fullScreenCover(isPresented: .constant(fullCover), content: {
				AddNote(onTap: onTapGesture)
			})

			VStack {
				HStack {
					Text("Notes")
						.font(.title)
					Spacer()
					ToolsView()
				}
				.frame(maxWidth: 350.0)

				Spacer(minLength: 20)
				
				HStack {
					NoteList(notes: store.notes)
				}
			}
		}
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView(store: noteStore)
	}
}
