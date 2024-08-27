//
//  PopupView.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 8/22/24.
//

import SwiftUI

struct PopupView: View {
    @State var isHidden = false
    let businesses: String
    let average: String
    let totalReview: String
    let allReviews: String
    
    var body: some View {
        Button("Show Summmary?") {
            isHidden = true
        }
        .popover(isPresented: $isHidden) {
            Text("Physical Therapists Near You: " + businesses)
                .foregroundColor(Color(red: 0, green: 0, blue: 0.5))
            Text("Average Rating of Therapists Near You: " + average)
                .foregroundColor(Color(red: 0, green: 0, blue: 0.5))
            Text("Businesses with Ratings: " + totalReview)
                .foregroundColor(Color(red: 0, green: 0, blue: 0.5))
            Text("Total Reviews for PT's Near You: " + allReviews)
                .foregroundColor(Color(red: 0, green: 0, blue: 0.5))
        }
    }
}
