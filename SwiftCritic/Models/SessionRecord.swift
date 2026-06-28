//
//  Item.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/22/26.
//

import Foundation
import SwiftData

@Model
final class SessionRecord {
    var date: Date
    var category: String
    var score: Int
    
    init(date: Date, category: String, score: Int) {
        self.date = date
        self.category = category
        self.score = score
    }
}
