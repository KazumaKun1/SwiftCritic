//
//  StepRow.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/28/26.
//

import SwiftUI

struct StepRow: View {
    var number: Int
    var text: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 10) {
            Text("\(number)")
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .foregroundStyle(color)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(color.opacity(0.2))
                )
            Text(text)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.primary)
                .font(.default)
            Spacer()
        }
    }
}

#Preview {
    StepRow(number: 1, text: "Onboarding Step here", color: .blue)
}
