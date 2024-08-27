//
//  NetworkError.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 8/22/24.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case missingAPIKey
    case networkFailure(Error)
    case noData
    case decodingFailure(Error)
    case requestFailed(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL provided was invalid."
        case .missingAPIKey:
            return "API key is missing from the environment variables."
        case .networkFailure(let error):
            return "Network request failed with error: \(error.localizedDescription)"
        case .noData:
            return "The request did not return any data."
        case .decodingFailure(let error):
            return "Failed to decode the response: \(error.localizedDescription)"
        case .requestFailed(let error):
            return "Request failed: \(error.localizedDescription)"
        }
    }
}
