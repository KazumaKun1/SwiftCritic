//
//  Item.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/22/26.
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
