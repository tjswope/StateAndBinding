//
//  3-GreetingSolution.swift
//  Lesson 3, finished.
//

import SwiftUI

struct GreetingSolution: View {
    @State private var name = ""
    @State private var age = 12

    var body: some View {
        Form {
            Section("About You") {
                TextField("Your name", text: $name)
                Stepper("Age: \(age)", value: $age, in: 1...120)
            }

            Section("Greeting") {
                Text(name.isEmpty ? "Type your name above." : "Hello, \(name)!")
                    .font(.title2)
                Text("Next year you'll be \(age + 1).")
            }

            Button("Clear", role: .destructive) {
                name = ""
                age = 12
            }
            .disabled(name.isEmpty)
        }
        .navigationTitle("Greeting")
    }
}

#Preview {
    GreetingSolution()
}
