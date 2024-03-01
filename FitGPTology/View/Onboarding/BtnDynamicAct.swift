//
//  BtnDynamicAct.swift
//  FitGPTology
//
//  Created by Daniel Felipe on 25/02/24.
//

import SwiftUI

struct BtnDynamicAct: View {
    //MARK: - Properties
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true

    let isAnimating: Bool

    @State private var widthScreen: Double = UIScreen.main.bounds.width - 70
    @State private var btnOffset: CGFloat = 0

    let hapticFeedback = UINotificationFeedbackGenerator()
    //MARK: - Body
    var body: some View {
        ZStack {
            //Part of the custom button
            //1. Background (Static)
            Capsule()
                .fill(Color.white.opacity(0.2))
            
            Capsule()
                .fill(Color.white.opacity(0.3))
                .padding(10)
            //2. Call-To-Action (Static)
            Text("Begin to explore")
                .font(.system(.title3, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .offset(x: 14)
            //3. Capsule (Dynamic width)
            HStack {
                Capsule()
                    .fill(Color.yellowLightSwiftUI)
                    .frame(width: btnOffset + 90)
                Spacer()
            }//: HStack
            //4. Circle (Draggable)
            HStack {
                ZStack {
                    Circle()
                        .fill(Color.blueLightSwiftUI)
                    Circle()
                        .fill(.white.opacity(0.25))
                        .padding(8)
                    Image(systemName: "arrowshape.forward.circle.fill")
                        .font(.system(size: 35, weight: .bold))
                }//: ZStack
                .offset(x:btnOffset)
                .foregroundStyle(Color.yellowLightSwiftUI)
                .frame(width: 90, height: 90)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            if gesture.translation.width > 0 && btnOffset <= widthScreen - 90 {
                                btnOffset = gesture.translation.width
                            }
                        }
                        .onEnded { _ in
                            withAnimation(Animation.easeOut(duration: 0.4)) {
                                if btnOffset > widthScreen / 2 {
                                    hapticFeedback                                        .notificationOccurred(.success)
                                    isOnboardingViewActive = false
                                } else {
                                    btnOffset = 0
                                }
                            }
                        }
                )
                Spacer()
            }//:HStack
        }//: ZStack
        .frame(width: widthScreen , height: 90, alignment: .center)
        .offset(y: isAnimating ? 0 : 40)
        .opacity(isAnimating ? 1 : 0.25 )
        .animation(.easeOut(duration: 1), value: isAnimating)
    }
}

#Preview {
    BtnDynamicAct(isAnimating: true)
}
