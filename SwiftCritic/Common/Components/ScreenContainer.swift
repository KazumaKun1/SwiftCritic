//
//  ScreenContainer.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/30/26.
//

import SwiftUI

struct ScreenContainer<Content: View>: View {
    @ViewBuilder var content: Content
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                content
            }
            .padding(.bottom)
            .frame(width: proxy.size.width, height: proxy.size.height)
            .scrollBounceBehavior(.basedOnSize)
            .ignoresSafeArea(edges: .bottom)
        }
    }
}
