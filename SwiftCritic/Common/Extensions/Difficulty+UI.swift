//
//  Difficulty+UI.swift
//  SwiftCritic
//

import SwiftUI

extension Difficulty {
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
        case .medium: .yellow
        case .hard: .red
        case .custom: .gray
        }
    }
}
