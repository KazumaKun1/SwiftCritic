//
//  ExistingUserView.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/28/26.
//

import SwiftUI
import SwiftData

struct ExistingUserView: View {
    @Query var configurations: [SessionConfiguration]
    let sessions: [SessionRecord]
    let mockConfigurations: [SessionConfiguration]
    
    var body: some View {
        VStack(alignment: .leading) {
            ScreenContainer {
                VStack(alignment: .leading) {
                    // MARK: - Navigation Title
                    NavigationTitleView()
                        .padding(.bottom)
                    
                    // MARK: - Header
                    VStack(alignment: .leading) {
                        Text("Ready to review?")
                            .font(.title)
                        Text("Sharpen your eye on real Swift defects")
                            .foregroundStyle(.secondary)
                    }
                    .padding(.bottom)
                    
                    // MARK: - Quick Start Section Row
                    HStack {
                        Text("Quick Start")
                            .font(.callout)
                        Text("picks up your last setup")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        Spacer()
                        if mockConfigurations.count > 2 {
                            SeeAllButton {
                                
                            }
                        }
                    }
                    .padding(.bottom, 8)
                    
                    // MARK: - Quick Start Items
                    HStack(spacing: 15) {
                        ForEach(mockConfigurations.prefix(2), id: \.self) { configuration in
                            QuickStartCardView(configuration: configuration)
                        }
                    }
                    
                    // MARK: - Recent Sessions Section Title
                    HStack {
                        Text("Recent sessions")
                            .font(.callout)
                        Spacer()
                        if sessions.count > 5 {
                            SeeAllButton {
                                
                            }
                        }
                    }
                    .padding(.vertical)
                    
                    VStack(spacing: 15) {
                        ForEach(sessions.prefix(5), id: \.self) { session in
                            RecentSessionRow(session: session)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            // MARK: - Action
            GeneralButton(text: "Start Review", iconName: "arrow.right") {
                // TODO: - Do an action here for first review
            }
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

private extension ExistingUserView {
    struct SeeAllButton: View {
        let action: () -> Void
        
        var body: some View {
            Button("See all") {
                action()
            }
            .font(.callout)
            .tint(.accentColor)
        }
    }
    
    struct QuickStartCardView: View {
        let configuration: SessionConfiguration
        
        var body: some View {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    DifficultyTag(difficulty: configuration.difficulty)
                        .padding(.bottom, 4)
                    VStack(alignment: .leading, spacing: 5) {
                        Text(configuration.category.name)
                            .font(.headline)
                        Text(configuration.category.subCategoryName)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.gray)
                    .opacity(0.2)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray.opacity(0.3), lineWidth: 1)
            )
        }
    }
    
    struct RecentSessionRow: View {
        let session: SessionRecord
        
        var body: some View {
            HStack(spacing: 10) {
                DifficultyTag(difficulty: session.difficulty)
                    .frame(width: 50)
                VStack(alignment: .leading) {
                    Text(session.category.name)
                        .font(.headline)
                    Text("\(session.date.relativeDisplay) - \(session.category.subCategoryName)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Text("\(session.score.value)")
                    .fontWeight(.bold)
                    .foregroundStyle(session.score.rating.color)
            }
            .padding(.vertical)
            .padding(.trailing)
            .padding(.leading, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.gray)
                    .opacity(0.2)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray.opacity(0.3), lineWidth: 1)
            )
        }
    }
}

#Preview {
    ExistingUserView(sessions: SessionRecord.mocks, mockConfigurations: SessionConfiguration.mocks)
        .modelContainer(for: SessionConfiguration.self, inMemory: true)
}
