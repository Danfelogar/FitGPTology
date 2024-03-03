//
//  CellTextBot.swift
//  FitGPTology
//
//  Created by Daniel Felipe on 27/02/24.
//

import SwiftUI

struct CellTextBot: View {
    //Properties
    @State var contentMSM: MessageStore
    @Environment(\.colorScheme) var colorScheme
    //Functions
    var isDarkMode: Bool {
        return colorScheme == .dark
    }
    //Body
    var body: some View {
        HStack(spacing: 2) {
            HStack(alignment: .bottom, spacing: 10) {
                Image(systemName: "baseball.diamond.bases")
                    .font(.system(size: 30))
                    .foregroundStyle(Color.greenLightSwiftUI)
                
                VStack(alignment: .leading, spacing: 10) {

                    VStack(alignment: .leading, spacing: 6) {
                        if contentMSM.image != nil {
                            AsyncImage(url: URL(string: contentMSM.image!), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
                                switch phase {
                                case.success(let img):
                                    img.imgModifier()
                                        .transition(.scale)
                                case .failure(_):
                                    Image(systemName: "ant.circle.fill").iconModifier()
                                case .empty:
                                    Image(systemName: "photo.circle.fill").iconModifier()
                                @unknown default:
                                    Image(systemName: "exclamationmark.icloud").iconModifier()
                                }
                            }
                        }
                    }//: VStack
                    
                    VStack(alignment: .leading, spacing: 3) {
                        Text(contentMSM.content)
                            .foregroundColor(.white)
                            .font(.system(size: 16,weight: .regular))
                            .multilineTextAlignment(.leading)
                    }//: VStack
                    
                    Text(contentMSM.timeSend.formatted(date: .omitted,time: .shortened))
                        .foregroundColor(.white)
                        .font(.system(size: 12,weight: .bold))
                }//: VStack
                .padding(10)
                .padding(.horizontal, 12)
                .background(Color.blueDarkSwiftUI)
                .roundedCorner(18, corners: [.topLeft, .topRight, .bottomRight])
            }
            
            Spacer()
        }//: HStack
    }
}

struct CellTextBot_Previews: PreviewProvider {
    static var previews: some View {
        CellTextBot(contentMSM: sampleMessageStoreBot)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
