//
//  ReviewView.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 9/9/24.
//

import SwiftUI

struct ReviewView: View {
    
    @EnvironmentObject var loginViewModel: LoginViewModel
        @StateObject private var reviewViewModel = ReviewViewModel()
        
        let business: Business
        
        let characterLimit = 500
        
        var body: some View {
            VStack {
                Text("Hello \(loginViewModel.username), please leave a review for \(business.name)")
                
              
                Picker("Rating: \(reviewViewModel.reviewRating)", selection: $reviewViewModel.reviewRating) {
                                ForEach(0...5, id: \.self) { rating in
                                    Text("\(rating)").tag(rating)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(.bottom, 10)
                
            
                ZStack(alignment: .topLeading) {
                    if reviewViewModel.reviewText == "" {
                        Text("Leave a review for \(business.name)...")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 12)
                    }
                    TextEditor(text: $reviewViewModel.reviewText)
                        .frame(height: 50)
                        .padding(4)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                        .onChange(of: reviewViewModel.reviewText) { newValue in
                            if newValue.count > characterLimit {
                                reviewViewModel.reviewText = String(newValue.prefix(characterLimit))
                            }
                        }
                }
                .padding(.bottom, 10)
                
             
                Text("\(reviewViewModel.reviewText.count)/\(characterLimit) characters")
                    .foregroundColor(reviewViewModel.reviewText.count > characterLimit ? .red : .gray)
                    .font(.footnote)
                    .padding(.bottom, 10)
                
              
                Button(action: {
                    if reviewViewModel.userId == nil {
                        reviewViewModel.fetchUserId(byUsername: loginViewModel.username)
                    }
                    reviewViewModel.submitReview(for: business.id)
                }) {
                    Text(reviewViewModel.isSubmitting ? "Submitting..." : "Submit Review")
                        .padding()
                        .background(reviewViewModel.isSubmitting ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(reviewViewModel.isSubmitting)
            
                if let errorMessage = reviewViewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding(.top, 10)
                }
                
                if let successMessage = reviewViewModel.successMessage {
                    Text(successMessage)
                        .foregroundColor(.green)
                        .padding(.top, 10)
                }
            }
            .padding()
            .onAppear {
                reviewViewModel.fetchUserId(byUsername: loginViewModel.username)
            }
        }
    }

