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
        NavigationStack {
            List {
                NavigationLink {
                    CreateWorkoutView()
                } label: {
                    Label("Create Workout", systemImage: "plus")
                }
                ForEach(workouts.sorted { $0.index < $1.index }) { workout in
                    NavigationLink {
                        WorkoutInfoView(workout: workout)
                    } label: {
                        Text(workout.name)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Workouts")
        }
    }

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
