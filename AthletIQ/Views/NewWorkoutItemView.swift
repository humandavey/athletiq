//
//  NewWorkoutItemView.swift
//  AthletIQ
//
//  Created by Davey Adams on 7/8/25.
//

import SwiftUI

struct NewWorkoutItemView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var items: [WorkoutItem]
    @State var itemName = ""
    @State var selectedType: WorkoutType = .reps
    @State var value = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Exercise Name", text: $itemName)
                
                Picker("Exercise Type", selection: $selectedType) {
                    ForEach(WorkoutType.allCases) { type in
                        Text(type.rawValue.capitalized)
                    }
                }
                
                TextField(selectedType.rawValue.capitalized, text: $value)
                    .keyboardType(.numberPad)
            }
            
            Section {
                Button {
                    items.append(WorkoutItem(name: itemName, type: selectedType, value: Int(value)!))
                    dismiss()
                } label: {
                    Text("Add To Workout")
                }
            }
        }
    }
}
