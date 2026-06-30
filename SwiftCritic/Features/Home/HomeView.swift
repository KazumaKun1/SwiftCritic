//
//  HomeView.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/22/26.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Query private var sessions: [SessionRecord]

    var body: some View {
//        if sessions.isEmpty {
//            FirstTimeUserView()
//        } else {
//            ExistingUserView(sessions: sessions)
//        }
        ExistingUserView(sessions: sessions, mockConfigurations: SessionConfiguration.mocks)
    }
}

#Preview {
    HomeView()
        .modelContainer(for: SessionRecord.self, inMemory: true)
}
