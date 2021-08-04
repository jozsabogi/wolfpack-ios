import UIKit

struct Note: Codable {
    let title: String
    let text: String
    let timestamp: Date
}

let note1 = Note(title: "MyNote", text: "Hi, there is my note", timestamp: Date())
let note2 = Note(title: "MyNote2", text: "Hi, there is my note2", timestamp: Date())
let note3 = Note(title: "MyNote3", text: "Hi, there is my note3", timestamp: Date())
let notes = [note1, note2, note3]

let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")

let propertyListEncoder = PropertyListEncoder()
let encodedNotes = try? propertyListEncoder.encode(notes)

try? encodedNotes?.write(to: archiveURL, options: .noFileProtection)

let propertyListDecoder = PropertyListDecoder()
if let retrievedNotesDAta = try? Data(contentsOf: archiveURL),
   let decodedNotes = try? propertyListDecoder.decode(Array<Note>.self, from: retrievedNotesDAta) {
    print(decodedNotes)
}
