//
//  Colors+Ext.swift
//  FitGPTology
//
//  Created by Daniel Felipe on 25/02/24.
//

import SwiftUI

//Ext for SwiftUI
extension Color {
    static let blueDarkSwiftUI = Color("BlueDark")
    static let blueLightSwiftUI = Color("BlueLight")
    static let greenLightSwiftUI = Color("GreenLight")
    static let yellowLightSwiftUI = Color("YellowLight")
}

//Ext for UIKit
extension UIColor {
    static let blueDarkUIKit = UIColor(named: "BlueDark") ?? UIColor.clear
    static let blueLightkUIKit = UIColor(named: "BlueLight") ?? UIColor.clear
    static let greenLightUIKit = UIColor(named: "GreenLight") ?? UIColor.clear
    static let yellowLightUIKit = UIColor(named: "YellowLight") ?? UIColor.clear
}
