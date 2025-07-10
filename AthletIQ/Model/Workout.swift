//
//  Workout.swift
//  AthletIQ
//
//  Created by Davey Adams on 7/8/25.
//

import Foundation
import SwiftData

@Model
final class Workout {
    var index: Int
    var name: String
    var sets: Int
    var betweenSets: Int
    var exercises: [Exercise]
    var currentIndex = 0
    var totalTime: Double {
        var time = 0.0
        
        for exercise in exercises {
            switch exercise.type {
            case .timed:
                time += Double(exercise.value) / 60.0
            case .reps:
                time += 3.0 * Double(exercise.value) / 60.0
            }
        }
        time *= Double(sets)
        time -= Double(betweenSets) / 60.0
        return time
    }
    
    init(name: String, sets: Int, betweenSets: Int, exercises: [Exercise], index: Int) {
        self.name = name
        self.sets = sets
        self.betweenSets = betweenSets
        self.exercises = exercises
        self.index = index
        
        for exercise in exercises {
            exercise.index += 1
        }
        
        self.exercises.insert(Exercise(name: "Break", type: .timed, value: 5, index: 0, hidden: true), at: 0)
        self.exercises.append(Exercise(name: "Break", type: .timed, value: betweenSets, index: self.exercises.count))
    }
}
