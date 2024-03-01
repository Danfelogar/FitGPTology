//
//  SuggestionBox.swift
//  FitGPTology
//
//  Created by Daniel Felipe on 28/02/24.
//

import SwiftUI

struct SuggestionBox: View {
    //MARK: - Properties
    @Environment(\.colorScheme) var colorScheme
    @State var iconName: String
    @State var title: String
    @State var content: String
    //MARK: - Functions
    var isDarkMode: Bool {
        return colorScheme == .dark
    }
    //MARK: - Body
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius:  18.0)
                .fill(Color(.systemBackground))
                .shadow(color: isDarkMode ? .gray : .black, radius: 1)
            
            VStack(alignment: .center, spacing: 6) {
                Image(systemName: iconName)
                    .font(.system(size: 40))
                    .foregroundStyle(Color.greenLightSwiftUI)
                
                Text(title)
                    .font(.system(size: 18, weight: .bold))
                    .multilineTextAlignment(.leading)
                
                Text(content)
                    .font(.system(size: 10, weight: .regular))
                    .multilineTextAlignment(.center)
            }//: VStack
            .padding(10)
        }//: ZStack
    }
}

struct SuggestionBox_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionBox(
            iconName: "baseball.diamond.bases",
            title: "Art",
            content: "Create digital art from\n sketches to finished\n pieces"
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
