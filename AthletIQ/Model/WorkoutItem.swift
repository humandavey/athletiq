//
//  WorkoutItem.swift
//  AthletIQ
//
//  Created by Davey Adams on 7/8/25.
//

import Foundation
import SwiftData

enum WorkoutType: String, Codable, CaseIterable, Identifiable {
    case timed = "Seconds"
    case reps = "Reps"
    
    var id: Self { self }
}

@Model
final class WorkoutItem {
    var name: String
    var type: WorkoutType
    var value: Int
    
    init(name: String, type: WorkoutType, value: Int) {
        self.name = name
        self.type = type
        self.value = value
    }
}
