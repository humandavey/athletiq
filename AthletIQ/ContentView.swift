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
    @Query private var workouts: [Workout]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(workouts) { workout in
                    NavigationLink {
                        StartWorkoutView(workout: workout)
                    } label: {
                        Text(workout.name)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    NavigationLink {
                        CreateWorkoutView()
                    } label: {
                        Label("Create Workout", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = WorkoutItem(type: .timed, value: 4)
//            modelContext.insert(newItem)
//        }
//    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(workouts[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: WorkoutItem.self, inMemory: true)
}
