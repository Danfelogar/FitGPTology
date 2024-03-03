//
//  EmptyState.swift
//  FitGPTology
//
//  Created by Daniel Felipe on 28/02/24.
//

import SwiftUI

struct EmptyState: View {
    //Properties
    //Body
    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                Image("assistant-bot")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                
                Text("Hellow! Danfelogar")
                    .font(.system(size: 28,weight: .bold))
                
                Text("Welcome To FitGPTology! we're Glad You're\n Here. Chat Away And Enjoy The\n experience! 🥋🏋🏽‍♀️")
                    .font(.system(size: 17,weight: .regular))
                    .multilineTextAlignment(.center)
                
                VStack(spacing: 12) {
                    HStack(spacing: 12) {
                        SuggestionBox(
                            iconName: "figure.walk",
                            title: "Fitness Chat",
                            content: "Ask about training\n plans, diets\n and advice."
                        )
                        .frame(maxWidth: 150, maxHeight: 150)
                        
                        SuggestionBox(
                            iconName: "heart.text.square",
                            title: "Nutrition",
                            content: "Get personalized food\n recommendations"
                        )
                        .frame(maxWidth: 150, maxHeight: 150)
                    }//: HStack
                    HStack(spacing: 12) {
                        SuggestionBox(
                            iconName: "figure.strengthtraining.traditional",
                            title: "Training",
                            content: "Design workout\n routines adapted\n to your level"
                        )
                        .frame(maxWidth: 150, maxHeight: 150)
                        
                        SuggestionBox(
                            iconName: "photo.fill.on.rectangle.fill",
                            title: "Recovery",
                            content: """
                                    With "create:" you can\n ask for visual help\n with your routines.
                                    """
                        )
                        .frame(maxWidth: 150, maxHeight: 150)
                    }//: HStack
                }//: VStack
            }//: VStack
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview { EmptyState() }
