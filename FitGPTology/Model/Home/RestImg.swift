//
//  RestImg.swift
//  FitGPTology
//
//  Created by Daniel Felipe on 1/03/24.
//

import Foundation

struct ImagesResult: Codable, Equatable {
    public struct URLResult: Codable, Equatable {
        public let url: String
    }
    public let created: TimeInterval
    public let data: [URLResult]
}
