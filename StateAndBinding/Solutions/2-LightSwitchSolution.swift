//
//  2-LightSwitchSolution.swift
//  Lesson 2, finished.
//

import SwiftUI

struct LightSwitchSolution: View {
    @State private var isOn = false

    var body: some View {
        VStack(spacing: 40) {
            Image(systemName: isOn ? "lightbulb.fill" : "lightbulb")
                .font(.system(size: 120))
                .foregroundStyle(isOn ? .yellow : .gray)

            Toggle("Light", isOn: $isOn)
                .padding(.horizontal, 60)
                .foregroundStyle(isOn ? .black : .white)

            Button(isOn ? "Turn Off" : "Turn On") {
                isOn.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(isOn ? Color.white : Color.black.opacity(0.85))
        .animation(.easeInOut, value: isOn)
        .navigationTitle("Light Switch")
    }
}

#Preview {
    LightSwitchSolution()
}
