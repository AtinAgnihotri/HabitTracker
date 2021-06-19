//
//  HabitTrackingViewModel.swift
//  HabitTracker
//
//  Created by Atin Agnihotri on 19/06/21.
//

import Foundation

class HabitTrackingViewModel: ObservableObject {
    
    private var currentHabitIndex = 0
    static let instance = HabitTrackingViewModel()
    
    @Published var habits = [HabitModel]()
    
    private init() {
//        habitStub()
    }
    
    func habitStub () {
        // Stub
        let habit1 = HabitModel(title: "Sample Habit1", description: "Stuff", count: 1)
        let habit2 = HabitModel(title: "Sample Habit2", description: "Stuff", count: 1)
        habits.append(habit1)
        habits.append(habit2)
    }
    
    func setDayCount(for habit: HabitModel, to count: Int) {
        let habitIndex = habits.firstIndex(where: { habit.id == $0.id })
        self.habits[habitIndex!].count = count
        print(habits)
    }
    
    func addHabitToList(name title: String, description: String) {
        let habit = HabitModel(title: title, description: description, count: 1)
        habits.append(habit)
    }
    
}
