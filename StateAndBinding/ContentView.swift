//
//  ContentView.swift
//  StateAndBinding
//
//  The lesson menu. Each lesson has a starter view (in Lessons) that you
//  finish together in class, and a finished version (in Solutions).
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("@State") {
                    NavigationLink("1. Counter") { CounterView() }
                    NavigationLink("2. Light Switch") { LightSwitchView() }
                    NavigationLink("3. Greeting") { GreetingView() }
                }
                Section("@Binding") {
                    NavigationLink("4. Scoreboard") { ScoreboardView() }
                    NavigationLink("5. Text Styler") { TextStylerView() }
                    NavigationLink("6. Packing List") { PackingListView() }
                }
                Section("Solutions") {
                    NavigationLink("1. Counter") { CounterSolution() }
                    NavigationLink("2. Light Switch") { LightSwitchSolution() }
                    NavigationLink("3. Greeting") { GreetingSolution() }
                    NavigationLink("4. Scoreboard") { ScoreboardSolution() }
                    NavigationLink("5. Text Styler") { TextStylerSolution() }
                    NavigationLink("6. Packing List") { PackingListSolution() }
                }
            }
            .navigationTitle("State & Binding")
        }
    }
}

#Preview {
    ContentView()
}
