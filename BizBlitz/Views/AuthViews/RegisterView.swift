//
//  RegisterView.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 8/26/24.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var registerViewModel: RegisterViewModel
    
    @State private var usernameString = ""
    @State private var emailString = ""
    @State private var passwordString = ""
    @State private var isLoading: Bool = false;
    
    var body: some View {
        VStack {
            TextField("Username...", text: $usernameString)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            TextField("Email...", text: $emailString)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            SecureField("Password...", text: $passwordString)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            if registerViewModel.isLoading {
                ProgressView("Logging in...")
                    .padding()
            }
            
            Button(action: {
                self.registerViewModel.username = self.usernameString
                self.registerViewModel.email = self.emailString
                self.registerViewModel.password = self.passwordString
                print("ButtON PRESSED")
                registerViewModel.register()
            }) {
                Text("Create Account")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(self.isLoading)
            .padding()
        }

    }
}

#Preview {
    RegisterView()
}
