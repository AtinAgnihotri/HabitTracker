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
    @State private var showAlert = false
    @State private var alertMsg = ""
    @State private var alertTitle = ""
    
    var body: some View {
        VStack {
            Spacer()
            Text("ADD HABIT").font(.largeTitle)
            Form {
                Section(header: Text("Name of the habit")) {
                    TextField("A good habit name", text: $title)
                }
                Section(header: Text("Description of the habit")) {
                    TextEditor(text: $description)
                }
                
//                Spacer()
            }
            Group {
                Section {
                    Button("SAVE") {
                        addHabit()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
//                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(Color.primary)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    Button("DISMISS") {
                        dismiss()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    
                    .background(Color.red)
                    .foregroundColor(Color.primary)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                }
                
            }.padding(.horizontal)
            Spacer()
            
        }.alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMsg), dismissButton: .default(Text("OK")))
        }
    }
    
    func showAlert(alertTitle: String, alertMsg: String) {
        self.alertTitle = alertTitle
        self.alertMsg = alertMsg
        showAlert = true
    }
    
    func addHabit() {
        guard title != "" else {
            showAlert(alertTitle: "Empty Name", alertMsg: "The name cannot be empty")
            return
        }
        
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
