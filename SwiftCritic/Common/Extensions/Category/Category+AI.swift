//
//  Category+AI.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/30/26.
//

extension Category {
    var promptHint: String {
        switch self {
        case .designPatterns(let sub):
            return "a Swift class or struct that misuses the \(sub.rawValue) design pattern"
        case .programmingPrinciples(let sub):
            return sub.promptHint
        case .logicControlFlow(let sub):
            return sub.promptHint
        case .memoryManagement(let sub):
            return sub.promptHint
        case .concurrency(let sub):
            return sub.promptHint
        case .apiDesign(let sub):
            return sub.promptHint
        }
    }
}
