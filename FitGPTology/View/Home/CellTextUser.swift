//
//  CellTextUser.swift
//  FitGPTology
//
//  Created by Daniel Felipe on 27/02/24.
//

import SwiftUI

struct CellTextUser: View {
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
            
            Spacer()
            
            HStack(alignment: .bottom, spacing: 10) {
                VStack(alignment: .trailing, spacing: 6) {
                    if contentMSM.image != nil {
                        if let imgData = Data(base64Encoded: contentMSM.image!) {
                            Image(uiImage: UIImage(data: imgData) ?? UIImage())
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180, height: 135 )
                        }
                    }
                    
                    VStack(alignment: .trailing, spacing: 3) {
                        Text(contentMSM.content)
                            .foregroundColor(.white)
                            .font(.system(size: 16,weight: .regular))
                            .multilineTextAlignment(.trailing)
                    }//: VStack
                    
                    Text(contentMSM.timeSend.formatted(date: .omitted,time: .shortened))
                        .foregroundColor(.white)
                        .font(.system(size: 12,weight: .bold))
                }//: VStack
                .padding(10)
                .padding(.horizontal, 12)
                .background(Color.blueLightSwiftUI)
                .roundedCorner(18, corners: [.topLeft, .topRight, .bottomLeft])
                .shadow(color: isDarkMode ? .gray : .black, radius: 2)
                
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 30))
                    .foregroundStyle(Color.greenLightSwiftUI)
            }
        }//: HStack
    }
}

struct CellTextUser_Previews: PreviewProvider {
    static var previews: some View {
        CellTextUser(contentMSM: sampleMessageStoreUser)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
