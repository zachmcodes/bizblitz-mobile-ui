//
//  LoginViewModel.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 8/26/24.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var loginResult: String = ""
    @Published var isLoading: Bool = false
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var isLoginSuccess: Bool = false
    
    private let loginService = LoginService()
    
    func login() {
        guard !username.isEmpty && !password.isEmpty else {
            alertMessage = "Username and Password cannot be empty"
            showAlert = true
            print("Login failed: Username or password is empty")
            return
        }
        
        // Ensure this function is not re-triggered if login is already successful
        guard !isLoginSuccess else {
            print("Already logged in, skipping login process.")
            return
        }
        
        isLoading = true
        print("Starting login for username: \(username)")
        loginService.fetchLoginAuthentication(username: username, password: password) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    print("Login successful: \(response)")
                    self?.loginResult = response
                    self?.isLoginSuccess = true
                case .failure(let error):
                    print("Login failed with error: \(error.localizedDescription)")
                    self?.alertMessage = "Login failed: \(error.localizedDescription)"
                    self?.showAlert = true
                }
            }
        }
    }
}
