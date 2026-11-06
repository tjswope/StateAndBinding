//
//  6-PackingListSolution.swift
//  Lesson 6, finished (with the delete bonus).
//

import SwiftUI

struct PackingListSolution: View {
    @State private var items = [
        PackingItem(name: "Toothbrush"),
        PackingItem(name: "Phone charger"),
        PackingItem(name: "Water bottle"),
    ]
    @State private var newItem = ""

    var body: some View {
        List {
            Section("\(packedCount) of \(items.count) packed") {
                ForEach($items) { $item in
                    PackingRowSolution(item: $item)
                }
                .onDelete { items.remove(atOffsets: $0) }
            }

            Section("Add an Item") {
                HStack {
                    TextField("Item name", text: $newItem)
                    Button("Add") {
                        items.append(PackingItem(name: newItem))
                        newItem = ""
                    }
                    .disabled(newItem.isEmpty)
                }
            }
        }
        .navigationTitle("Packing List")
    }

    private var packedCount: Int {
        items.filter(\.isPacked).count
    }
}

struct PackingRowSolution: View {
    @Binding var item: PackingItem

    var body: some View {
        Toggle(item.name, isOn: $item.isPacked)
            .strikethrough(item.isPacked)
    }
}

#Preview {
    NavigationStack { PackingListSolution() }
}

#Preview("Row") {
    @Previewable @State var item = PackingItem(name: "Sunscreen")
    List { PackingRowSolution(item: $item) }
}
