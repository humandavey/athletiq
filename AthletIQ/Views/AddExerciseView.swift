//
//  AddExerciseView.swift
//  AthletIQ
//
//  Created by Davey Adams on 7/8/25.
//

import SwiftUI

struct AddExerciseView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var exercises: [Exercise]
    @State var exerciseName = ""
    @State var selectedType: ExerciseType = .reps
    @State var value = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Exercise Name", text: $exerciseName)
                
                Picker("Exercise Type", selection: $selectedType) {
                    ForEach(ExerciseType.allCases) { type in
                        Text(type.rawValue.capitalized)
                    }
                }
                
                TextField(selectedType.rawValue.capitalized, text: $value)
                    .keyboardType(.numberPad)
            }
            
            Section {
                Button {
                    exercises.append(Exercise(name: exerciseName, type: selectedType, value: Int(value)!, index: exercises.count))
                    dismiss()
                } label: {
                    Text("Add To Workout")
                }
            }
        }
    }
}
