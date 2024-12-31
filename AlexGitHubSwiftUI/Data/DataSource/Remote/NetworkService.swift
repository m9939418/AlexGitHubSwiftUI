//
// NetworkService.swift
// AlexGitHubSwiftUI
//
// Created by AlexYang on 2024/12/30.
//


import Foundation

final class NetworkService {
    static func fetchUsers() async throws -> [UserDTO] {
        let urlString = "https://api.github.com/users"
        guard let url = URL(string: urlString) else {
            throw ApiError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let resp = response as? HTTPURLResponse, resp.statusCode == 200 else {
            throw ApiError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([UserDTO].self, from: data)
        } catch {
            throw ApiError.invalidData
        }
    }
}




