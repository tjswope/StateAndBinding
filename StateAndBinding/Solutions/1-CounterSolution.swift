//
//  1-CounterSolution.swift
//  Lesson 1, finished.
//

import SwiftUI

struct CounterSolution: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 30) {
            Text("\(count)")
                .font(.system(size: 96, weight: .bold))
                .contentTransition(.numericText())

            HStack(spacing: 40) {
                Button {
                    count -= 1
                } label: {
                    Image(systemName: "minus.circle.fill")
                }
                .disabled(count == 0)

                Button {
                    count += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
            .font(.system(size: 60))

            Button("Reset") {
                count = 0
            }
            .buttonStyle(.bordered)
        }
        .animation(.default, value: count)
        .navigationTitle("Counter")
    }
}

#Preview {
    CounterSolution()
}
