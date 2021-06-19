//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Atin Agnihotri on 19/06/21.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var habitTracker = HabitTrackingViewModel.instance
    @State private var title = ""
    @State private var description = ""
    var body: some View {
        VStack {
            Spacer()
            Text("ADD HABIT").font(.largeTitle)
            Form {
                Section(header: Text("Name of the habit")) {
                    TextField("A good habit name", text: $title)
                }
                Section(header: Text("Description of the habit")) {
//                    TextField("", text: $description)
                    TextEditor(text: $description)
                }
                Section {
                    Button("SAVE") {
                        addHabit()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(Color.primary)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    Button("DISMISS") {
                        dismiss()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .foregroundColor(Color.primary)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                }
//                Spacer()
            }
            Spacer()
            
        }
    }
    
    func addHabit() {
        habitTracker.addHabitToList(name: title, description: description)
        dismiss()
    }
    
    func dismiss() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView()
    }
}
