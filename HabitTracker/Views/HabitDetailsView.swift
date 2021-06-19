//
//  HabitDetailsView.swift
//  HabitTracker
//
//  Created by Atin Agnihotri on 19/06/21.
//

import SwiftUI

struct HabitDetailsView: View {
    @State var habit: HabitModel
    

    var formattedCount: String {
        "Count: \(habit.count) day" + (habit.count == 1 ? "" : "s")
    }
    
//    init(_ habitModel: HabitModel) {
//        habit = HabitModel(title: "Stugg", description: "Mugg", count: 1)
//    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                Stepper(value: $habit.count, in:1...Int.max) {
                    Text(formattedCount)
                }.padding()
                
                ScrollView(.vertical) {
                    Text(habit.description)
                        .padding()
                }
                
                
                
            }.navigationBarTitle(
                habit.title,
                displayMode: .inline)
            .navigationBarItems(trailing:
                Button("Reset") {
                    self.habit.count = 1
                }
                .foregroundColor(Color.primary)
                .padding(5)
                .background(Color.red)
                .clipShape(Capsule())
            )
        }
    }
}

struct HabitDetailsView_Previews: PreviewProvider {
    static let habit = HabitModel(title: "Sample habit", description: "This is a sample habit", count: 1)
    static var previews: some View {
        HabitDetailsView(habit: habit)
    }
}
