//
// UserLsitViewModel.swift
// AlexGitHubSwiftUI
//
// Created by AlexYang on 2024/12/30.
//


import Foundation

@MainActor
final class UserListViewModel: ObservableObject {
    @Published var users: [UserDTO]?
    @Published var isLoading = false
    @Published var isShowError = false
    @Published var errorMessage: String?
    
    func fetchUsers() async {
        self.isLoading = true
        do {
            let users = try await NetworkService.fetchUsers()
            self.users = users
            self.isLoading = false
            print(users)
        } catch(let error) {
            print(error.localizedDescription)
            self.isLoading = false
            self.isShowError = true
            self.errorMessage = error.localizedDescription
        }
    }
}
