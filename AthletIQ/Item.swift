//
//  Item.swift
//  AthletIQ
//
//  Created by Davey Adams on 7/8/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
