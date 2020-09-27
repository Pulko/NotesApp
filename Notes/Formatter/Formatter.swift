//
//  Formatter.swift
//  Notes
//
//  Created by Фёдор Ткаченко on 27.09.20.
//

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
		.font(.subheadline)
		.foregroundColor(.secondary)
}
