//
//  GeneralButton.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/28/26.
//

import SwiftUI

struct GeneralButton: View {
    var text: String
    var iconName: String?
    
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(text)
                if let iconName {
                    Image(systemName: iconName)
                        .font(.caption)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
        }
        .buttonBorderShape(.roundedRectangle)
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    GeneralButton(text: "Start your first review", iconName: "arrow.right", action: {})
}
