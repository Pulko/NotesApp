import Foundation
import SwiftUI

let formatNoteTitle = {(_ view: Text) -> Text in
	view
		.font(.headline)
		.fontWeight(.heavy)
		.foregroundColor(.primary)
}

let formatNoteContent = {(_ view: Text) -> Text in
	view
		.font(.body)
		.foregroundColor(.secondary)
}
