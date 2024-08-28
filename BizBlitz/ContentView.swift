//
//  ContentView.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 1/5/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var landingViewModel = LandingViewModel()
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            if loginViewModel.isLoginSuccess {
                LandingView(landingViewModel: landingViewModel, username: loginViewModel.username)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("FlexSpot")
                                .foregroundColor(Color(red: 0, green: 0, blue: 0.5))
                                .font(.largeTitle.bold())
                                .accessibilityAddTraits(.isHeader)
                        }
                    }
                    .environmentObject(loginViewModel)
            } else {
                LoginView()
                    .environmentObject(loginViewModel)
            }
        }
    }
}
