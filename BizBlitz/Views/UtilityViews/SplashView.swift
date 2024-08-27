//
//  SplashView.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 1/5/24.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive: Bool = false
    @StateObject private var loginViewModel = LoginViewModel()
    
    var body: some View {
        if isActive {
            ContentView()
                .environmentObject(loginViewModel)
        } else {
            VStack {
                ZStack {
                    VStack {
                        Rectangle()
                            .ignoresSafeArea()
                            .foregroundColor(Color(red: 1, green: 0.56, blue: 0.3))
                        Rectangle()
                            .ignoresSafeArea()
                            .foregroundColor(Color(red: 0, green: 0.281, blue: 0.7))
                    }
                    Image("diamond_app_icon")
                        .resizable()
                        .scaledToFit()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
