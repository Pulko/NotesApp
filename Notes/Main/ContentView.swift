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
		VStack {
			Spacer()
			
			HStack {
				ToolsView()
			}
			.frame(height: 70)
			
			Spacer()

			HStack {
				NoteList(notes: store.notes)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView(store: noteStore)
	}
}
