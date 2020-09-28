//
//  ContentView.swift
//  Notes
//
//  Created by Фёдор Ткаченко on 27.09.20.
//

import SwiftUI
import CoreData

struct ContentView: View {
	@ObservedObject var store: NoteStore

	var body: some View {
		NavigationView {
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
			.navigationBarHidden(true)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView(store: noteStore)
	}
}
