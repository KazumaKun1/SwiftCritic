//
//  Difficulty+UI.swift
//  SwiftCritic
//

import SwiftUI

nonisolated extension Difficulty {
    var name: String {
        switch self {
        case .easy: "Easy"
        case .medium: "Medium"
        case .hard: "Hard"
        case .custom: "Custom"
        }
    }
    
    var shortName: String {
        switch self {
        case .easy: "Easy"
        case .medium: "Med"
        case .hard: "Hard"
        case .custom: "Cust"
        }
    }
    
    var color: Color {
        switch self {
        case .easy: .green
        case .medium: .orange
        case .hard: .red
        case .custom: .gray
        }
    }
}
