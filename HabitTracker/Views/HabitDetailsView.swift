//
//  HabitDetailsView.swift
//  HabitTracker
//
//  Created by Atin Agnihotri on 19/06/21.
//

import SwiftUI

struct HabitDetailsView: View {
    @ObservedObject var habitTracker = HabitTrackingViewModel.instance
    @State private var dayCount = 2
    
    var habit: HabitModel
    

    var formattedCount: String {
        "Count: \(habit.count) day" + (habit.count == 1 ? "" : "s")
    }
    
    init(_ habit: HabitModel) {
        self.habit = habit
        /* this is what compiler does while generating memberwise init for State */
        self._dayCount = State(wrappedValue: habit.count)
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                Stepper(
                    value: $dayCount,
                    in:1...Int.max,
                    step: 1) {
                    Text(formattedCount)
                }
                .padding()
                .onChange(of: dayCount, perform: { value in
                    habitTracker.setDayCount(for: habit, to: value)
                })
                
                ScrollView(.vertical) {
                    Text(habit.description)
                        .padding()
                }
                
            }.navigationBarTitle(
                habit.title, displayMode: .inline)
            .navigationBarItems(trailing:
                Button("Reset") {
                    habitTracker.setDayCount(for: habit, to: 1)
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
    static let habitTracker = HabitTrackingViewModel.instance
    
    static var previews: some View {
        HabitDetailsView(habitTracker.habits[0])
    }
}
