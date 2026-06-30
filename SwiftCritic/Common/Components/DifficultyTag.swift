//
//  DifficultyTag.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/30/26.
//

import SwiftUI

struct DifficultyTag: View {
    let difficulty: Difficulty
    
    var body: some View {
        Text(difficulty.shortName.uppercased())
            .font(.caption2)
            .fontWeight(.semibold)
            .foregroundColor(difficulty.color)
            .padding(6)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(difficulty.color.opacity(0.2))
            )
    }
}

#Preview {
    DifficultyTag(difficulty: .easy)
}
