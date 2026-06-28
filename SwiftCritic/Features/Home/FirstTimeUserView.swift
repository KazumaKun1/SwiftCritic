//
//  FirstTimeUserView.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/28/26.
//

import SwiftUI

struct FirstTimeUserView: View {
    var body: some View {
        VStack(alignment: .leading) {
            // MARK: - Title
            NavigationTitleView()
            
            Spacer()
            
            // MARK: - Logo
            Image(systemName: "ellipsis.curlybraces")
                .font(.largeTitle)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.gray)
                        .opacity(0.2)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                )
            
            // MARK: - Content
            Text("Find the bug before the compiler does.")
                .font(.title)
                .padding(.vertical, 10)
            Text("Read an AI-generated Swift snippet. flag the lines you think are wrong, and get scored on what you caught, missed and over-called.")
                .font(.subheadline)
                .padding(.bottom)
            StepRow(number: 1, text: "Pick a category & difficulty", color: .pink)
            StepRow(number: 2, text: "Flag suspect lines & comment", color: .blue)
            StepRow(number: 3, text: "Get scored feedback instantly", color: .green)
            
            Spacer()
            
            // MARK: - Action
            GeneralButton(text: "Start your first review", iconName: "arrow.right") {
                // TODO: - Do an action here for first review
            }
        }
        .padding()
    }
}

#Preview {
    FirstTimeUserView()
}
