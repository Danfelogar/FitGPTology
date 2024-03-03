//
//  RestChat.swift
//  FitGPTology
//
//  Created by Daniel Felipe on 1/03/24.
//

import Foundation
import OpenAI

struct ChatResult: Codable, Equatable {
    public struct Choice: Codable, Equatable {
        public let index: Int
        public let message: Chat
        public let finishReason: String
    }
    
    public struct Usage: Codable, Equatable {
        public let promptTokens: Int
        public let completionTokens: Int
        public let totalTokens: Int
    }
    
    public let id: String
    public let object: String
    public let created: TimeInterval
    public let model: Model
    public let choices: [Choice]
    public let usage: Usage
}
