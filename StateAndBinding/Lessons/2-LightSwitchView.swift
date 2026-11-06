//
//  2-LightSwitchView.swift
//  Lesson 2: The $ sign gives a control (Toggle) a binding to your @State,
//  so the control can read AND change it.
//

import SwiftUI

struct LightSwitchView: View {
    // TODO 1: Make this an @State property.
    var isOn = false

    var body: some View {
        VStack(spacing: 40) {
            Image(systemName: isOn ? "lightbulb.fill" : "lightbulb")
                .font(.system(size: 120))
                .foregroundStyle(isOn ? .yellow : .gray)

            // TODO 2: .constant(false) is a binding that never changes, so the
            //         switch snaps back. Replace it with $isOn.
            //         isOn  -> reads the value (a Bool)
            //         $isOn -> a binding: a two-way connection to the value
            Toggle("Light", isOn: .constant(false))
                .padding(.horizontal, 60)

            // TODO 3: Add a Button that flips the light with isOn.toggle().
            //         The Toggle moves too. Why? (Both use the same @State.)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        // TODO 4: Make the background dark when the light is off:
        //         .background(isOn ? Color.white : Color.black.opacity(0.85))
        .navigationTitle("Light Switch")
    }
}

#Preview {
    LightSwitchView()
}
