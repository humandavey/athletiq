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
    var items: [WorkoutItem] = []
    
    init(name: String, items: [WorkoutItem]) {
        self.name = name
        self.items = items
    }
}
