//
//  SwiftCriticApp.swift
//  SwiftCritic
//
//  Created by Arviejhay Alejandro on 6/22/26.
//

import SwiftUI
import SwiftData

@main
struct SwiftCriticApp: App {
    @State private var coordinator = AppCoordinator()
    
    let sharedModelContainer: ModelContainer = {
        let schema = Schema([
            SessionRecord.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                HomeView()
                    .navigationDestination(for: AppRoute.self) { route in
                        switch route {
                        case .configuration:
                            Text("Challenge Config")
                        case .review:
                            Text("Review")
                        case .result:
                            Text("Result")
                        case .history:
                            Text("History")
                        }
                    }
            }
            .environment(coordinator)
        }
        .modelContainer(sharedModelContainer)
    }
}
