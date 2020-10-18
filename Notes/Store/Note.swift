import Foundation

struct UserNoteContent {
  var id: UUID = UUID()
  var row: String
}

struct UserNote: Identifiable {
  var id: UUID = UUID()
  var title: String
  var content: Array<UserNoteContent>
  var isDone: Bool
}

var testData: Array<UserNote> = [
  UserNote(
    title: "Start new Swift app",
    content: [
      UserNoteContent(row: "Create Notes as a learning kick off"),
    ],
    isDone: true
  ),
  UserNote(
    title: "Custom navigations",
    content: [
      UserNoteContent(row: "Try to create custom navigations and views"),
      UserNoteContent(row: "Deal with Store"),
    ],
    isDone: false
  ),
  UserNote(
    title: "My idea",
    content: [
      UserNoteContent(row: "Think of my own idea to implement it with Swift"),
      UserNoteContent(row: "Think of implementation"),
    ],
    isDone: false
  ),
  UserNote(
    title: "Add Core Data",
    content: [
      UserNoteContent(row: "Learn"),
      UserNoteContent(row: "Implement"),
      UserNoteContent(row: "Test"),
    ],
    isDone: false
  )
]
