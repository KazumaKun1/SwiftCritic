//
//  Difficulty.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/29/26.
//

nonisolated enum Difficulty: Codable, CaseIterable {
    case easy
    case medium
    case hard
    case custom(CustomDifficultyConfiguration)
    
    static var allCases: [Difficulty] {
        [.easy,
         .medium,
         .hard,
         .custom(.init(subtlety: .obvious, snippetLength: .short, hasRedHerrings: true))]
    }
}
