//
//  HeaderChat.swift
//  FitGPTology
//
//  Created by Daniel Felipe on 27/02/24.
//

import SwiftUI

struct HeaderChat: View {
    //MARK: - Properties
    //MARK: - Body
    var body: some View {
        ZStack {
            HStack {
                Image("logo-white")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 60)
                
                Spacer()
                
                Image(systemName: "list.dash")
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundStyle(.white)
            }//: HStack
            .frame(width: .infinity)
            .padding(.horizontal)
            .padding(.bottom, 10)
        }//: ZStack
    }
}

#Preview { HeaderChat() }
