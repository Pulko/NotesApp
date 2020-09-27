//
//  Note.swift
//  Notes
//
//  Created by Фёдор Ткаченко on 27.09.20.
//

import Foundation

struct UserNote: Identifiable {
  var id: UUID = UUID()
  var title: String
  var content: String
  var isDone: Bool
}

var testData: Array<UserNote> = [
  UserNote(
    title: "Start new Swift app",
    content: "Create Notes as a learning kick off",
    isDone: true
  ),
  UserNote(
    title: "Custom navigations",
    content: "Try to create custom navigations and views",
    isDone: false
  ),
  UserNote(
    title: "My idea",
    content: "Think of my own idea to implement it with Swift",
    isDone: false
  )
]
