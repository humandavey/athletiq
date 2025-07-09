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
    
    init(name: String, sets: Int, betweenSets: Int, items: [WorkoutItem]) {
        self.name = name
        self.sets = sets
        self.betweenSets = betweenSets
        self.items = items
    }
}
