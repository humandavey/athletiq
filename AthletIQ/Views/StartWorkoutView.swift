//
//  StartWorkoutView.swift
//  AthletIQ
//
//  Created by Davey Adams on 7/8/25.
//

import SwiftUI

struct StartWorkoutView: View {
    @State var workout: Workout
    
    func getTimeString() -> String {
        let hours = Int(workout.totalTime / 60.0)
        let minutes = Int(workout.totalTime)
        let seconds = Int((workout.totalTime - Double(minutes)) * 60)
        
        var str = ""
        if hours > 0 { str += String(hours) + "h " }
        if minutes > 0 { str += String(minutes) + "m " }
        if seconds > 0 { str += String(seconds) + "s" }
        if str.isEmpty { str = "0s" }
        
        return str
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    ForEach(workout.items) { exercise in
                        HStack {
                            Text(exercise.name)
                            Spacer()
                            Text("\(exercise.value) \(exercise.type.rawValue.capitalized)")
                        }
                    }
                    
                    if workout.sets > 0 {
                        Text("Rest for \(workout.betweenSets) seconds")
                        Text("Repeat \(workout.sets) times")
                    }
                }
                
                Section {
                    HStack {
                        Text("Approximate Workout Time")
                        Spacer()
                        Text(getTimeString())
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        Label("Start Workout", systemImage: "play.fill")
                    }
                }
            }
        }.navigationTitle(workout.name.capitalized)
    }
}
