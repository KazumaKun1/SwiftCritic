//
//  NavigationTitleView.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/28/26.
//

import SwiftUI

struct NavigationTitleView: View {
    var body: some View {
        HStack {
            Image(systemName: "ellipsis.curlybraces")
                .font(.title)
            Text("SwiftCritic")
                .font(.subheadline)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    NavigationTitleView()
}
