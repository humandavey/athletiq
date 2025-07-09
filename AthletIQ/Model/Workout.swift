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
    var items: [WorkoutItem]
    var currentIndex = 0
    var totalTime: Double {
        var time = 0.0
        
        for item in items {
            switch item.type {
            case .timed:
                time += Double(item.value) / 60.0
            case .reps:
                time += 3.0 * Double(item.value) / 60.0
            }
        }
        time *= Double(sets)
        time -= Double(betweenSets) / 60.0
        return time
    }
    
    init(name: String, sets: Int, betweenSets: Int, items: [WorkoutItem], index: Int) {
        self.name = name
        self.sets = sets
        self.betweenSets = betweenSets
        self.items = items
        self.index = index
        
        for item in items {
            item.index += 1
        }
        
        self.items.insert(WorkoutItem(name: "Break", type: .timed, value: 5, index: 0), at: 0)
        self.items.append(WorkoutItem(name: "Break", type: .timed, value: betweenSets, index: self.items.count))
    }
}
