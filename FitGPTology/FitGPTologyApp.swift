//
//  FitGPTologyApp.swift
//  FitGPTology
//
//  Created by Daniel Felipe on 25/02/24.
//

import SwiftUI
import SwiftData

@main
struct FitGPTologyApp: App {
    //MARK: - Properties
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    //MARK: - Body
    var body: some Scene {
        WindowGroup {
            if !isOnboardingViewActive{
                ContentView()
            } else {
                OnboardingView()
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
