import SwiftUI

struct JournalView: View {
    private let notesKey = "notes"
    
    @AppStorage("notes") private var storedNotesData: Data = Data()

    @State private var storedNotes: [Note] = []

    @State private var newNoteText: String = ""

    
    var body: some View {
        VStack {
            Text("My Journal")
                .font(.largeTitle)
                .bold()
                .padding()

            List {
                Section(header: Text("New Note")) {
                    TextField("Write your note...", text: $newNoteText)
                    Button("Save") {
                        saveNote()
                    }
                }

                displayNotes()
            }
        }
        .onAppear {
            storedNotes = decodeStoredNotes()
        }
    }

    struct Note: Identifiable, Codable { 
        var id = UUID()
        let date: Date
        let text: String
    }

    private func saveNote() {
        let newNote = Note(date: Date(), text: newNoteText)
        storedNotes.append(newNote)
        newNoteText = ""
        storedNotesData = encodeStoredNotes()
    }

    private func displayNotes() -> some View {
        return ForEach(groupedNotes(), id: \.0) { date, notesForDate in 
            Section(header: Text(formattedDate(date: date))) {
                ForEach(notesForDate) { note in
                    Text(note.text)
                }
            }
        }
    }
    
    private func groupedNotes() -> [(Date, [Note])] {
        let grouping = Dictionary(grouping: storedNotes, by: { Calendar.current.startOfDay(for: $0.date) })
        return grouping.sorted(by: { $0.key > $1.key })
    }

    private func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    private func encodeStoredNotes() -> Data {
        do {
            return try JSONEncoder().encode(storedNotes)
        } catch {
            print("Error encoding notes data: \(error)")
            return Data()
        }
    }
    
    private func decodeStoredNotes() -> [Note] {
        do {
            return try JSONDecoder().decode([Note].self, from: storedNotesData)
        } catch {
            print("Error decoding notes data: \(error)")
            return []
        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}
