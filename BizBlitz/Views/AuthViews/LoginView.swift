//
//  LoginView.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 8/26/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    @StateObject var registerViewModel = RegisterViewModel()
    
    @State private var usernameString = ""
    @State private var passwordString = ""
    @State private var isLoading: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Username...", text: $usernameString)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                SecureField("Password...", text: $passwordString)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                if loginViewModel.isLoading {
                    ProgressView("Logging in...")
                        .padding()
                }
                
                Button(action: {
                    self.loginViewModel.username = self.usernameString
                    self.loginViewModel.password = self.passwordString
                    print("ButtON PRESSED")
                    loginViewModel.login()
                }) {
                    Text("Login")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(self.isLoading)
                .padding()
                NavigationLink(destination: RegisterView().environmentObject(registerViewModel)) {
                    Text("Create an Account?")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .underline()
                        .padding()
                }
            }
        }
    }
}
