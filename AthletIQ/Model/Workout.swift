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
    var name: String
    var sets: Int
    var betweenSets: Int
    var items: [WorkoutItem]
    var totalTime: Double {
        var time = 0.0
        
        for item in items {
            if item.type == .timed {
                time += Double(item.value) / 60.0
            } else if item.type == .reps {
                time += 5.0 * Double(item.value) / 60.0
            }
        }
        time *= Double(sets)
        time += Double(betweenSets) * Double(sets - 1) / 60.0
        return time
    }
    
    init(name: String, sets: Int, betweenSets: Int, items: [WorkoutItem]) {
        self.name = name
        self.sets = sets
        self.betweenSets = betweenSets
        self.items = items
    }
}
