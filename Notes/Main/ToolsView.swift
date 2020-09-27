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
			GroupBox() {
				Text("Add")
			}
			
			GroupBox() {
				Text("Copy")
			}
			
			GroupBox() {
				Text("Remove")
			}
		}
	}
}

struct ToolsView_Previews: PreviewProvider {
	static var previews: some View {
		ToolsView()
	}
}
