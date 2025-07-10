//
//  CreateWorkoutView.swift
//  AthletIQ
//
//  Created by Davey Adams on 7/8/25.
//

import SwiftUI
import SwiftData

struct CreateWorkoutView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    @Query private var workouts: [Workout]
    @State private var name = ""
    @State private var sets = ""
    @State private var betweenSets = ""
    @State private var exercises: [Exercise] = []
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Workout Name", text: $name)
                    TextField("Sets", text: $sets)
                        .keyboardType(.numberPad)
                    TextField("Time Between Sets", text: $betweenSets)
                        .keyboardType(.numberPad)
                }
                
                List {
                    ForEach(exercises) { exercise in
                        HStack {
                            Text(exercise.name)
                            Spacer()
                            Text("\(exercise.value) \(exercise.type.rawValue)")
                        }
                    }
                    NavigationLink {
                        AddExerciseView(exercises: $exercises)
                    } label: {
                        Label("Add Exercise", systemImage: "plus")
                    }
                }
                
                Section {
                    Button {
                        if !name.isEmpty && !sets.isEmpty && !betweenSets.isEmpty {
                            modelContext.insert(Workout(name: name, sets: Int(sets)!, betweenSets: Int(betweenSets)!, exercises: exercises, index: workouts.count))
                            
                            dismiss()
                        } else {
                            showAlert = true
                        }
                    } label: {
                        Text("Create Workout")
                    }
                }
                .alert("You must fill in all fields", isPresented: $showAlert) {}
            }
        }
    }
}
