//
//  HabitTrackingViewModel.swift
//  HabitTracker
//
//  Created by Atin Agnihotri on 19/06/21.
//

import Foundation

class HabitTrackingViewModel: ObservableObject {
    
    static let instance = HabitTrackingViewModel()
    
    @Published var habits = [HabitModel]()
    
    private init() {
        
    }
    
}
