//
//  LandingView.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 8/26/24.
//

import SwiftUI

struct LandingView: View {
    @ObservedObject var landingViewModel: LandingViewModel
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        VStack {
            Divider()
            Text("Find healthcare providers near you!")
                .foregroundColor(Color(red: 0, green: 0, blue: 0.5))
                .font(.headline)
                .italic()
            Spacer()
            Image("physicalTherapy")
                .resizable()
                .scaledToFit()
            Spacer()
            Spacer()
            VStack {
                DisclosureGroup("Filter", isExpanded: $landingViewModel.isExpanded) {
                    HStack {
                        Text("Sort By:")
                        Picker("Sort By...", selection: $landingViewModel.selection) {
                            ForEach(landingViewModel.sortOptions, id: \.self) {
                                Text($0)
                            }
                        }.pickerStyle(.menu)
                    }
                    HStack {
                        Text("Search For:")
                        Picker("Search For...", selection: $landingViewModel.searchSelection) {
                            ForEach(landingViewModel.searchOptions, id: \.self) {
                                Text($0)
                            }
                        }.pickerStyle(.menu)
                    }
                }.padding(.horizontal)
                TextField("Location...", text: $landingViewModel.location)
                    .modifier(customViewModifier(roundedCorners: 6, startColor: .orange, endColor: Color(red: 0, green: 0, blue: 1.8), textColor: .white))
                    .submitLabel(.done)
                    .padding(.horizontal)
                    .onSubmit {
                        landingViewModel.ptViewModel.fetchPTData(location: landingViewModel.location.replacingOccurrences(of: " ", with: "_"), query: landingViewModel.selection, sortType: landingViewModel.searchSelection)
                        landingViewModel.isHidden.toggle()
                    }
            }
            Divider()
            NavigationLink(destination: PTView(ptViewModel: landingViewModel.ptViewModel), isActive: $landingViewModel.shouldTransit) {
                ZStack {
                    Capsule()
                        .frame(width: 150, height: 50)
                        .foregroundColor(Color(red: 0, green: 0, blue: 0.5))
                    Text("Search Near You")
                        .foregroundColor(.white)
                }
                .opacity(landingViewModel.isPressed ? 0.4 : 1.0)
                .scaleEffect(landingViewModel.isPressed ? 1.2 : 1.0)
                .onTapGesture {
                    landingViewModel.ptViewModel.fetchPTData(location: landingViewModel.location.replacingOccurrences(of: " ", with: "_"), query: landingViewModel.searchSelection, sortType: landingViewModel.selection)
                    landingViewModel.location = ""
                    landingViewModel.shouldTransit = true
                }
                .pressEvents {
                    withAnimation(.easeIn(duration: 0.2)) {
                        landingViewModel.isPressed = true
                    }
                } onRelease: {
                    withAnimation {
                        landingViewModel.isPressed = false
                    }
                }
            }
            Text("A ZacharyMathes application")
                .font(.footnote)
                .foregroundColor(.orange)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("FlexSpot")
                    .foregroundColor(Color(red: 0, green: 0, blue: 0.5))
                    .font(.largeTitle.bold())
                    .accessibilityAddTraits(.isHeader)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    loginViewModel.isLoginSuccess = false
                }) {
                    Text("Logout")
                }
            }
        }
    }
}
