//
//  5-TextStylerView.swift
//  Lesson 5: A settings sheet that changes the screen behind it.
//
//  This one runs, but it has a bug: move the slider in the sheet, close it,
//  and nothing changed. Find out why, then fix it with @Binding.
//

import SwiftUI

struct TextStylerView: View {
    @State private var size = 32.0
    @State private var isBold = false
    @State private var color = Color.purple
    @State private var showingSettings = false

    var body: some View {
        VStack(spacing: 30) {
            Text("Hello, SwiftUI!")
                .font(.system(size: size, weight: isBold ? .bold : .regular))
                .foregroundStyle(color)

            Button("Style Settings", systemImage: "slider.horizontal.3") {
                showingSettings = true
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Text Styler")
        .sheet(isPresented: $showingSettings) {
            // TODO 2: Pass bindings: size: $size, isBold: $isBold, color: $color
            StyleSettingsView(size: size, isBold: isBold, color: color)
                .presentationDetents([.medium])
        }
    }
}

struct StyleSettingsView: View {
    // The bug: @State makes the sheet its OWN copy of each value. The sheet
    // changes its copy; the main screen never hears about it.
    // TODO 1: Change all three to @Binding. Xcode then shows an error on the
    //         sheet above, because it's still passing plain values.
    @State var size: Double
    @State var isBold: Bool
    @State var color: Color
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Form {
                Section("Size: \(Int(size))") {
                    Slider(value: $size, in: 12...72)
                }
                Toggle("Bold", isOn: $isBold)
                ColorPicker("Color", selection: $color)
            }
            .navigationTitle("Style")
            .toolbar {
                Button("Done") { dismiss() }
            }
        }
    }
}

// TODO 3: Bonus: add an "Italic" setting. You'll need a new @State in
//         TextStylerView, a @Binding in StyleSettingsView, a Toggle, and
//         .italic(isItalic) on the Text.

#Preview {
    NavigationStack { TextStylerView() }
}
