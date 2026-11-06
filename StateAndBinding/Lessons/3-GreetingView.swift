//
//  3-GreetingView.swift
//  Lesson 3: @State works for any value: here a String and an Int,
//  connected to a TextField and a Stepper.
//

import SwiftUI

struct GreetingView: View {
    // TODO 1: Add @State to both properties.
    var name = ""
    var age = 12

    var body: some View {
        Form {
            Section("About You") {
                // TODO 2: Replace .constant("") with $name.
                TextField("Your name", text: .constant(""))
                // TODO 3: Replace .constant(12) with $age.
                Stepper("Age: \(age)", value: .constant(12), in: 1...120)
            }

            Section("Greeting") {
                // TODO 4: Show "Hello, <name>!" when a name is typed, and
                //         "Type your name above." when it's empty.
                //         Hint: name.isEmpty
                Text("Hello!")

                // TODO 5: Show how old they'll be next year: "Next year you'll be 13."
            }

            // Bonus: Add a "Clear" button that sets name to "" and age to 12.
            //        Disable it when the name is already empty.
        }
        .navigationTitle("Greeting")
    }
}

#Preview {
    GreetingView()
}
