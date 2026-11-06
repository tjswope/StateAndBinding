//
//  1-CounterView.swift
//  Lesson 1: @State holds a value that belongs to this view.
//

import SwiftUI

struct CounterView: View {
    // TODO 1: Add `count += 1` inside the + button below. Read the error:
    //         a view is a struct, and its body can't change its own properties.
    // TODO 2: Put @State in front of `var count`. Now SwiftUI stores the
    //         value for the view and redraws the screen whenever it changes.
    //         (Mark @State properties `private`: only this view owns them.)
    var count = 0

    var body: some View {
        VStack(spacing: 30) {
            Text("\(count)")
                .font(.system(size: 96, weight: .bold))

            HStack(spacing: 40) {
                Button {
                    // TODO 3: Subtract 1 from count.
                } label: {
                    Image(systemName: "minus.circle.fill")
                }
                Button {
                    // TODO 3: Add 1 to count.
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
            .font(.system(size: 60))

            // TODO 4: Add a "Reset" button that sets count back to 0.
            // Bonus: Disable the minus button when count is 0 with .disabled(...).
        }
        .navigationTitle("Counter")
    }
}

#Preview {
    CounterView()
}
