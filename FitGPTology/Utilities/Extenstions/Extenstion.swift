//
//  Extenstion.swift
//  FitGPTology
//
//  Created by Daniel Felipe on 29/02/24.
//

import SwiftUI
// Transform base64 to string
extension UIImage {
    func toBase64String() -> String? {
        guard let data = self.pngData() else { return nil }
        return data.base64EncodedString(options: .endLineWithLineFeed)
    }
}

// New properties for view, custom rounded
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

extension Image {
    func imgModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imgModifier()
            .frame(maxWidth: 120)
            .foregroundStyle(Color.greenLightSwiftUI, Color.yellowLightSwiftUI)
            .opacity(0.65)
    }
}

extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}
