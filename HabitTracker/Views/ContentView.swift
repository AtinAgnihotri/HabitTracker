//
//  ContentView.swift
//  HabitTracker
//
//  Created by Atin Agnihotri on 19/06/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var habitTracker = HabitTrackingViewModel.instance
    
    var body: some View {
        NavigationView {
            Form {
                ForEach(habitTracker.habits) { habit in
                    NavigationLink(habit.title + " : Count " + String(habit.count) , destination: HabitDetailsView(habit))
                }.onDelete(perform: { indexSet in
                    deleteHabit(index: indexSet)
                })
            }.navigationBarTitle("Habit Tracker", displayMode: .inline)
            .navigationBarItems(leading: EditButton(),
                trailing: Button(action: addHabit) {
                    Image(systemName: "plus.circle")
                        .scaleEffect(2)
            })
        }
        
    }
    
    func addHabit() {
        
    }
    
    func deleteHabit(index set: IndexSet) {
        habitTracker.habits.remove(atOffsets: set)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
}
