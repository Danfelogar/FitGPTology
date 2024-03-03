//
//  String+Ext.swift
//  FitGPTology
//
//  Created by Daniel Felipe on 27/02/24.
//

import Foundation
import SwiftUI
import OpenAI

enum OwnerType: String, Codable {
    case user = "user"
    case bot = "bot"
}

enum Field: Int, CaseIterable {
    case messageGenerator
}

//Query Img
let keyQueryImg = "create:"
let genericResponse = "This is my interpretation of your request"
let numberImgGenerated = 1
let sizeImg = "512x512"

//Secret Key
let openAI = OpenAI(apiToken: "SECRET-KEY")

