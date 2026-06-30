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
        // TODO: - Remove this once the whole feature for home is working. As of now, we will use mock configurations.
        ExistingUserView(sessions: sessions, mockConfigurations: SessionConfiguration.mocks)
    }
}

#Preview {
    HomeView()
        .modelContainer(for: SessionRecord.self, inMemory: true)
}
