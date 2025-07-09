//
//  ContentView.swift
//  AthletIQ
//
//  Created by Davey Adams on 7/8/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [WorkoutItem]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text(item.type.rawValue)
                    } label: {
                        Text(item.type.rawValue)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = WorkoutItem(type: .timed, value: 4)
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: WorkoutItem.self, inMemory: true)
}
