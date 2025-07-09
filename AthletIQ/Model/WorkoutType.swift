//
//  WorkoutItem.swift
//  AthletIQ
//
//  Created by Davey Adams on 7/8/25.
//

import Foundation
import SwiftData

enum WorkoutType: String, Codable {
    case timed = "Timed"
    case reps = "Reps"
}

@Model
final class WorkoutItem {
    var type: WorkoutType
    var value: Double
    
    init(type: WorkoutType, value: Double) {
        self.type = type
        self.value = value
    }
}
