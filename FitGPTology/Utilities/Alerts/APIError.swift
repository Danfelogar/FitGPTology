//
//  APIError.swift
//  FitGPTology
//
//  Created by Daniel Felipe on 1/03/24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
