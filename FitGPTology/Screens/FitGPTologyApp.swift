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
    //SwiftData initialize with closure
    var sharedModelContainer: ModelContainer = {
        //define schema
        let schema = Schema([
            MessageStore.self,
        ])
        //create an instanse and the store persist with var "false"
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        // try /catch
        do {
            //create instanse with schema like model and configuration previus
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()//auto invocation
    //MARK: - Body
    var body: some Scene {
        WindowGroup {
            if !isOnboardingViewActive{
                HomeView()
            } else {
                OnboardingView()
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
