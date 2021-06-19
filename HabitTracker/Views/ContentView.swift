//
//  ContentView.swift
//  HabitTracker
//
//  Created by Atin Agnihotri on 19/06/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static let habit = HabitModel(title: "Sample habit", description: "This is a sample habit", count: 1)
    static var previews: some View {
        ContentView()
    }
}
