//
//  Exercise.swift
//  AthletIQ
//
//  Created by Davey Adams on 7/8/25.
//

import Foundation
import SwiftData

enum ExerciseType: String, Codable, CaseIterable, Identifiable {
    case timed = "Seconds"
    case reps = "Reps"
    
    var id: Self { self }
}

@Model
final class Exercise {
    var index: Int
    var name: String
    var type: ExerciseType
    var value: Int
    var hidden: Bool
    
    init(name: String, type: ExerciseType, value: Int, index: Int, hidden: Bool = false) {
        self.name = name
        self.type = type
        self.value = value
        self.index = index
        self.hidden = hidden
    }
}
