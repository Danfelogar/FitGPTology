//
//  Alert.swift
//  FitGPTology
//
//  Created by Daniel Felipe on 1/03/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    
    let title: Text
    let message: Text
    let dismissBtn: Alert.Button
}

struct AlertContext {
    //MARK: - Network generic Alerts
    static let invalidData = AlertItem(
        title: Text("Server Error"),
        message: Text("Data received from the server was invalid. Please contact support."),
        dismissBtn: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(
        title: Text("Server Error"),
        message: Text("Invalid response from the server. Please try again later or contact support."),
        dismissBtn: .default(Text("OK")))
    
    static let invalidURL = AlertItem(
        title: Text("Server Error"),
        message: Text("There was an issue connecting to the server. If this persists, please contact support."),
        dismissBtn: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(
        title: Text("Server Error"),
        message: Text("Unable to complete your request at this time. Please check your internet connection."),
        dismissBtn: .default(Text("OK")))
}
