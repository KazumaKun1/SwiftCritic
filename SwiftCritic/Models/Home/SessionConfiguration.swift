//
//  SessionConfiguration.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/29/26.
//

import Foundation
import SwiftData

@Model
final class SessionConfiguration {
    var difficulty: Difficulty
    var category: Category
    var date: Date
    
    init(difficulty: Difficulty, category: Category, date: Date) {
        self.difficulty = difficulty
        self.category = category
        self.date = date
    }
}

#if DEBUG
extension SessionConfiguration {
    static var mocks: [SessionConfiguration] {
        [
            SessionConfiguration(difficulty: .easy, category: .designPatterns(.factory), date: .now),
            SessionConfiguration(difficulty: .medium, category: .concurrency(.actorIsolation), date: .now),
            SessionConfiguration(difficulty: .hard, category: .memoryManagement(.arcPitfalls), date: .now)
        ]
    }
}
#endif
