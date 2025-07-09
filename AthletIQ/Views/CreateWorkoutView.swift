//
//  CreateWorkoutView.swift
//  AthletIQ
//
//  Created by Davey Adams on 7/8/25.
//

import SwiftUI

struct CreateWorkoutView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var sets = ""
    @State private var betweenSets = ""
    @State private var workoutItems: [WorkoutItem] = []
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
                    ForEach(workoutItems) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("\(item.value) \(item.type.rawValue)")
                        }
                    }
                    NavigationLink {
                        NewWorkoutItemView(items: $workoutItems)
                    } label: {
                        Label("Add Exercise", systemImage: "plus")
                    }
                }
                
                Section {
                    Button {
                        if !name.isEmpty && !sets.isEmpty && !betweenSets.isEmpty {
                            modelContext.insert(Workout(name: name, sets: Int(sets)!, betweenSets: Int(betweenSets)!, items: workoutItems))
                            
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
