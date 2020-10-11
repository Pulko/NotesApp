//
//  AddNote.swift
//  Notes
//
//  Created by Фёдор Ткаченко on 30.09.20.
//

import Foundation
import SwiftUI

struct ContentPlaceholder {
  var id: UUID = UUID()
  var index: Int
}

struct AddNote: View {
  @State var title: String = ""
  @State var content_first: String = ""
  @State var content_second: String = ""
  @State var content_third: String = ""
  @State var error: Bool = false
  
  @State var content_count: Int = 1
  @State var contents: Array<ContentPlaceholder> = [
    ContentPlaceholder(index: 1),
  ]
  
  func bindStateValue(_ index: Int) -> Binding<String> {
    if (index == 0) {
      return $content_first
    }
    
    if (index == 1) {
      return $content_second
    }
    
    return $content_third
  }
  
  func addNote() -> Void {
    if (!title.isEmpty) {
      let noteContent = [content_first, content_second, content_third]
        .filter { text in
          !text.isEmpty
        }
        .map { text in
          return UserNoteContent(row: text)
        }
      
      let newNote: UserNote = UserNote(title: title, content: noteContent, isDone: false)
      
      addNewNote(newNote)
    } else {
      error.toggle()
    }
  }

  var body: some View {
    NavigationView {
      VStack {
        Form {
          Section {
            Text("Note Title")
            TextField("Add a title", text: $title)
              .onTapGesture {
                error = false
              }
          }
          
          ForEach(contents, id: \.id) { object in
              Section {
                Text("Note Content (\(object.index)/3)")
                TextField("Add a content", text: bindStateValue(object.index))
                  .onTapGesture {
                    error = false
                  }
              }
            }
          
          
          if (content_count < 3) {
            Section {
              HStack {
                Spacer()
                Image(systemName: "plus")
                  .font(.body)
                  .foregroundColor(.blue)
                  .onTapGesture {
                    if (content_count < 3) {
                      content_count += 1
                      contents.append(ContentPlaceholder(index: content_count))
                    }
                  }
                Spacer()
              }
            }
          }
        }
          
          Section {
            HStack {
              Spacer()
                if (!error) {
                    Button("Save Note") {
                      addNote()
                    }
                      .foregroundColor(.white)
                } else {
                  Text("Note should at least have a title")
                    .foregroundColor(.red)
                }
              Spacer()
            }
          }
          .frame(minHeight: 60.0)
          .background(error ? Color.white : Color.green)

        
      }
      .navigationBarHidden(true)
    }
  }
}

struct AddNote_Previews: PreviewProvider {
  static var previews: some View {
    AddNote()
  }
}
