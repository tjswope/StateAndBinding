//
//  6-PackingListView.swift
//  Lesson 6: @State can hold an array, and ForEach($array) hands each row
//  a binding to its own item.
//

import SwiftUI

struct PackingItem: Identifiable {
    let id = UUID()
    var name: String
    var isPacked = false
}

struct PackingListView: View {
    @State private var items = [
        PackingItem(name: "Toothbrush"),
        PackingItem(name: "Phone charger"),
        PackingItem(name: "Water bottle"),
    ]
    @State private var newItem = ""

    var body: some View {
        List {
            Section("\(packedCount) of \(items.count) packed") {
                // TODO 2: Loop over bindings: ForEach($items) { $item in
                //         and pass the binding to the row: PackingRow(item: $item)
                ForEach(items) { item in
                    PackingRow(item: item)
                }
            }

            Section("Add an Item") {
                HStack {
                    TextField("Item name", text: $newItem)
                    Button("Add") {
                        // TODO 3: Append PackingItem(name: newItem) to items,
                        //         then clear newItem.
                    }
                    .disabled(newItem.isEmpty)
                }
            }
        }
        .navigationTitle("Packing List")
    }

    /// Updates by itself once the rows can change their items.
    private var packedCount: Int {
        items.filter(\.isPacked).count
    }
}

struct PackingRow: View {
    // TODO 1: Change this to @Binding var item: PackingItem
    //         so the row changes the item in the parent's array.
    var item: PackingItem

    var body: some View {
        // Then replace .constant(item.isPacked) with $item.isPacked.
        // ($item.isPacked is a binding to one property inside the item.)
        Toggle(item.name, isOn: .constant(item.isPacked))
            .strikethrough(item.isPacked)
    }
}

// Bonus: Add .onDelete { items.remove(atOffsets: $0) } to the ForEach so
//        rows can be swiped away.

#Preview {
    NavigationStack { PackingListView() }
}
