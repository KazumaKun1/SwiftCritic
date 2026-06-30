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
    var difficulty: Difficulty
    var category: Category
    var date: Date
    var numberOfLinesFlagged: Int
    var score: Score
    
    init(difficulty: Difficulty,
         category: Category,
         date: Date,
         numberOfLinesFlagged: Int,
         score: Score) {
        self.difficulty = difficulty
        self.date = date
        self.category = category
        self.score = score
        self.numberOfLinesFlagged = numberOfLinesFlagged
    }
}

#if DEBUG
extension SessionRecord {
    static var mocks: [SessionRecord] {
        [
            SessionRecord(difficulty: .easy, category: .programmingPrinciples(.solid), date: .daysAgo(1), numberOfLinesFlagged: 4, score: Score(value: 56)),
            SessionRecord(difficulty: .medium, category: .apiDesign(.accessControl), date: .daysAgo(3), numberOfLinesFlagged: 4, score: Score(value: 75)),
            SessionRecord(difficulty: .hard, category: .concurrency(.actorIsolation), date: .daysAgo(10), numberOfLinesFlagged: 4, score: Score(value: 90))
        ]
    }
}
#endif
