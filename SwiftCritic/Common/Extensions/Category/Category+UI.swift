//
//  Category+UI.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/30/26.
//

// TODO: - For future implementation, find a way to make this avoid OCP violation even enum are supposed to be exhaustive.

nonisolated extension Category {
    var name: String {
        switch self {
        case .designPatterns: "Design Patterns"
        case .programmingPrinciples: "Programming Principles"
        case .logicControlFlow: "Logic and Control Flow"
        case .memoryManagement: "Memory Management"
        case .concurrency: "Concurrency"
        case .apiDesign: "API Design"
        }
    }
    
    var subCategoryName: String {
        switch self {
        case .designPatterns(let sub): sub.rawValue
        case .programmingPrinciples(let sub): sub.name
        case .logicControlFlow(let sub): sub.name
        case .memoryManagement(let sub): sub.name
        case .concurrency(let sub): sub.name
        case .apiDesign(let sub): sub.name
        }
    }
}
