//
//  GuidedWorkoutView.swift
//  AthletIQ
//
//  Created by Davey Adams on 7/9/25.
//

import SwiftUI

struct GuidedWorkoutView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var workout: Workout
    @State var counter = 0
    @State var paused = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var currentExercise: Exercise {
        workout.exercises.sorted { $0.index < $1.index }[workout.currentIndex % workout.exercises.count]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Form {
                    HStack {
                        Spacer()
                        Text(currentExercise.name)
                        Spacer()
                    }
                }
                
                VStack {
                    ProgressView(value: Double(workout.currentIndex) / Double(workout.exercises.count * workout.sets - 1))
                        .padding()
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    Spacer()
                    
                    Text(String(currentExercise.value - counter))
                        .font(.system(size: 80, weight: .bold))
                        .padding()
                        .onTapGesture {
                            if currentExercise.type == .reps {
                                workout.currentIndex += 1
                                counter = 0
                            }
                        }
                    
                    Spacer()
                    
                    HStack {
                        Button {
                            if workout.currentIndex - 1 < 0 { return }
                            workout.currentIndex -= 1
                            counter = 0
                        } label: {
                            Image(systemName: "backward.circle")
                                .scaleEffect(2)
                                .padding(6)
                        }
                        
                        Button {
                            paused.toggle()
                        } label: {
                            Image(systemName: "\(paused ? "play" : "pause").circle")
                                .scaleEffect(2)
                                .padding(6)
                        }
                        
                        Button {
                            if workout.currentIndex > workout.sets * workout.exercises.count - 2 {
                                workout.currentIndex = 0
                                counter = 0
                                dismiss()
                            } else {
                                workout.currentIndex += 1
                                counter = 0
                            }
                        } label: {
                            Image(systemName: "forward.circle")
                                .scaleEffect(2)
                                .padding(6)
                        }
                    }
                    Spacer()
                }
            }
        }
        .onReceive(timer) { _ in
            if currentExercise.type == .timed && !paused {
                counter += 1
            }
            
            if currentExercise.value - counter < 0 {
                if workout.currentIndex > workout.sets * workout.exercises.count - 2 {
                   workout.currentIndex = 0
                   counter = 0
                   dismiss()
                } else {
                    workout.currentIndex += 1
                    counter = 0
                }
            }
        }
    }
}
