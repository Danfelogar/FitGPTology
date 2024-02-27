//
//  OnboardingView.swift
//  FitGPTology
//
//  Created by Daniel Felipe on 25/02/24.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: - Properties
    @State private var isAnimating: Bool = false
    //MARK: - Body
    var body: some View {
        ZStack {
            Color.blueDarkSwiftUI.ignoresSafeArea()
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .opacity(isAnimating ? 1 : 0.35)
                    .scaleEffect(isAnimating ? 1 : 0.5)
                    .animation(.easeOut(duration: 1), value: isAnimating)
                    .offset(y: isAnimating ? 0 : -40)
                    .onAppear(perform: {
                        isAnimating = true
                    })
                
                Spacer()
                    .frame(maxHeight: 28)

                Text("Welcome, \nUnlock Your Potential \nwith AI-Driven Fitness \nSolutions.")
                    .opacity(isAnimating ? 1 : 0.35)
                    .scaleEffect(isAnimating ? 1 : 0.5)
                    .animation(.easeOut(duration: 0.6), value: isAnimating)
                    .foregroundStyle(.white)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .font(.system(.title2, design: .serif))
                
                Spacer()
                
                BtnDynamicAct(isAnimating: isAnimating)
                Text("All rights reserved Danfelogar®")
                    .padding(.top, 10)
                    .opacity(isAnimating ? 1 : 0.35)
                    .foregroundStyle(.gray)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .font(.system(.title2, design: .serif))

            }//: VStack
            .padding(.horizontal, 8)
            .padding(.vertical, 2)
        }//:ZStack
    }
}

#Preview { OnboardingView() }
