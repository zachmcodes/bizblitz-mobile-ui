//
//  RegisterViewModel.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 8/26/24.
//

import Foundation
import SwiftUI
import Combine

class RegisterViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loginResult: String = ""
    @Published var isLoading: Bool = false
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var isLoginSuccess: Bool = false
    
    private let registerService = RegisterService()
    
    func register() {
        guard !username.isEmpty && !password.isEmpty else {
            alertMessage = "Username and Password cannot be empty"
            showAlert = true
            print("Login failed: Username or password is empty")
            return
        }
        
        isLoading = true
        print("Starting login for username: \(username)")
        registerService.registerUser(username: username, email: email, password: password) { [weak self] result in
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
