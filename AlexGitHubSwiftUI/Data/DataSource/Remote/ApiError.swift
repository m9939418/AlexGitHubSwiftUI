//
// ApiError.swift
// AlexGitHubSwiftUI
//
// Created by AlexYang on 2024/12/30.
//


import Foundation

enum ApiError: LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidData
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL found."
        case .invalidResponse: return "Invalid Response found."
        case .invalidData: return "Invalid Data found."
        }
    }
}
