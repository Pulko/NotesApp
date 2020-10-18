import Foundation
import SwiftUI

struct ContentPlaceholder {
  var id: UUID = UUID()
  var index: Int
}

struct AddNote: View {
  var onTap: (() -> Void)!
  
  @State var title: String = ""
  @State var content_first: String = ""
  @State var content_second: String = ""
  @State var content_third: String = ""
  @State var error: Bool = false
  
  @State var content_count: Int = 0
  @State var contents: Array<ContentPlaceholder> = []
  
  func bindStateValue(_ index: Int) -> Binding<String> {
    if (index == 1) {
      return $content_first
    }

    if (index == 2) {
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
      onTap()
    } else {
      error.toggle()
    }
  }

  var body: some View {
    VStack {
      
      BackButton()
        .padding(/*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/)
        .onTapGesture {
          onTap()
        }
      
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
                  Text("Sub Content (\(object.index)/3)")
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
                  Text("New sub content")
                    .font(.body)
                    .foregroundColor(.blue)
                    
                  Spacer()
                }
                .onTapGesture {
                  if (content_count < 3) {
                    content_count += 1
                    contents.append(ContentPlaceholder(index: content_count))
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
                        .foregroundColor(.green)
                  } else {
                    Text("Note should at least have a title")
                      .foregroundColor(.red)
                  }
                Spacer()
              }
            }
          }
        }
        .navigationBarHidden(true)
      }
    }
  }
}

struct BackButton: View {
  var body: some View {
    HStack {
      Text("Back")
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
      Spacer()
    }
    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
  }
}



struct AddNote_Previews: PreviewProvider {
  static var previews: some View {
    AddNote()
  }
}
