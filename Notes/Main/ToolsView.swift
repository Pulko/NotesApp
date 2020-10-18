import Foundation
import SwiftUI

struct ToolsView: View {
	var body: some View {
			HStack {
				GroupBox {
					VStack {
						Image(systemName: "plus")
							.font(.largeTitle)
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
