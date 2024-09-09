//
//  ReviewViewModel.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 9/9/24.
//

import SwiftUI
import Combine

class ReviewViewModel: ObservableObject {
    @Published var reviewText: String = ""
    @Published var reviewRating: Int = 0
    @Published var userId: Int?
    @Published var isSubmitting: Bool = false
    @Published var errorMessage: String? = nil
    @Published var successMessage: String? = nil
    
    private let reviewService = ReviewService()
    private var cancellables = Set<AnyCancellable>()
    
    func fetchUserId(byUsername username: String) {
        isSubmitting = true
        reviewService.getUserIdByUsername(username: username) { [weak self] result in
            DispatchQueue.main.async {
                self?.isSubmitting = false
                switch result {
                case .success(let id):
                    self?.userId = id
                case .failure(let error):
                    self?.errorMessage = "Failed to fetch user ID: \(error.localizedDescription)"
                }
            }
        }
    }
    
    func submitReview(for businessId: String) {
        guard let userId = userId else {
            errorMessage = "User ID not found. Please try again."
            return
        }
        
        isSubmitting = true
        reviewService.createReview(userId: userId, businessId: businessId, reviewText: reviewText, rating: reviewRating) { [weak self] result in
            DispatchQueue.main.async {
                self?.isSubmitting = false
                switch result {
                case .success(let response):
                    self?.successMessage = "Review submitted successfully: \(response)"
                    self?.reviewText = ""
                    self?.reviewRating = 0
                case .failure(let error):
                    self?.errorMessage = "Failed to submit review: \(error.localizedDescription)"
                }
            }
        }
    }
}
