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

