//
//  Difficulty+AI.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 7/1/26.
//

extension Difficulty {
    var snippetLength: SnippetLength {
        switch self {
        case .easy: .short
        case .medium: .medium
        case .hard: .long
        case .custom(let config): config.snippetLength
        }
    }
    
    var visibilityHint: String {
        switch self {
        case .easy:   "Surface — issues should be visible at a glance to a careful reader"
        case .medium: "Subtle — issues require careful line-by-line reading to spot"
        case .hard:   "Hidden — issues require reasoning through logic or data flow to find; no issue should be immediately obvious"
        case .custom(let config): config.subtlety.promptHint
        }
    }
}
