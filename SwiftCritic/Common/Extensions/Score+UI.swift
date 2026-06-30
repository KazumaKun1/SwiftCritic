//
//  Score+UI.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/30/26.
//

import SwiftUI

extension Score.Rating {
    var color: Color {
        switch self {
        case .excellent: .green
        case .good: .blue
        case .fair: .orange
        case .needsImprovement: .red
        }
    }
}
