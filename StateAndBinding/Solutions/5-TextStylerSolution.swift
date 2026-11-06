//
//  5-TextStylerSolution.swift
//  Lesson 5, finished (with the italic bonus).
//

import SwiftUI

struct TextStylerSolution: View {
    @State private var size = 32.0
    @State private var isBold = false
    @State private var isItalic = false
    @State private var color = Color.purple
    @State private var showingSettings = false

    var body: some View {
        VStack(spacing: 30) {
            Text("Hello, SwiftUI!")
                .font(.system(size: size, weight: isBold ? .bold : .regular))
                .italic(isItalic)
                .foregroundStyle(color)

            Button("Style Settings", systemImage: "slider.horizontal.3") {
                showingSettings = true
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Text Styler")
        .sheet(isPresented: $showingSettings) {
            StyleSettingsSolutionView(size: $size, isBold: $isBold, isItalic: $isItalic, color: $color)
                .presentationDetents([.medium])
        }
    }
}

struct StyleSettingsSolutionView: View {
    @Binding var size: Double
    @Binding var isBold: Bool
    @Binding var isItalic: Bool
    @Binding var color: Color
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Form {
                Section("Size: \(Int(size))") {
                    Slider(value: $size, in: 12...72)
                }
                Toggle("Bold", isOn: $isBold)
                Toggle("Italic", isOn: $isItalic)
                ColorPicker("Color", selection: $color)
            }
            .navigationTitle("Style")
            .toolbar {
                Button("Done") { dismiss() }
            }
        }
    }
}

#Preview {
    NavigationStack { TextStylerSolution() }
}
