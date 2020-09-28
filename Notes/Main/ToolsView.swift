//
//  ToolsView.swift
//  Notes
//
//  Created by Фёдор Ткаченко on 27.09.20.
//

import Foundation
import SwiftUI

struct ToolsView: View {
	var body: some View {
			HStack {
				GroupBox {
					VStack {
						NavigationLink(destination: Text("Add note")) {
							Image(systemName: "plus")
								.font(.largeTitle)
						}
					}
				}
				.foregroundColor(.green)
			}
	}
}

struct ToolsView_Previews: PreviewProvider {
	static var previews: some View {
		ToolsView()
	}
}
