//
//  HabitModel.swift
//  HabitTracker
//
//  Created by Atin Agnihotri on 19/06/21.
//

import Foundation

struct HabitModel: Codable, Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var count: Int
}
