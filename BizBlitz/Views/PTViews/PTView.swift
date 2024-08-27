//
//  PTView.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 1/5/24.
//

import SwiftUI

struct PTView: View {
    @StateObject var ptViewModel: PTViewModel
    
    var body: some View {
        VStack {
            PopupView(businesses: String(ptViewModel.businesses.count),
                      average: String(PTData(businesses: ptViewModel.businesses).average),
                      totalReview: String(PTData(businesses: ptViewModel.businesses).totalWithReview),
                      allReviews: String(PTData(businesses: ptViewModel.businesses).totalReviews))
            
            List(ptViewModel.businesses) { business in
                NavigationLink(destination: PTDetailView(business: business)) {
                    HStack(alignment: .top) {
                        VStack {
                            Text("Business:")
                                .bold()
                                .frame(height: 20, alignment: .leading)
                            Text(String(business.name))
                                .frame(minWidth: 100, maxWidth: .infinity, alignment: .center)
                                .lineLimit(3)
                                .minimumScaleFactor(0.7)
                        }
                        Spacer(minLength: 16)
                        Spacer(minLength: 16)
                        VStack {
                            Text("Reviews:")
                                .bold()
                                .frame(height: 20, alignment: .leading)
                            Text(String(business.review_count))
                                .frame(minWidth: 80, maxWidth: .infinity, alignment: .center)
                        }
                        Spacer(minLength: 16)
                        Spacer(minLength: 16)
                        VStack {
                            Text("Rating:")
                                .bold()
                                .frame(height: 20, alignment: .leading)
                            BizBlitz.RatingView(rating: business.rating)
                            Text(String(business.rating))
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Physical Therapists")
                        .foregroundColor(Color(red: 0, green: 0, blue: 0.5))
                        .font(.largeTitle.bold())
                        .accessibilityAddTraits(.isHeader)
                }
            }
        }
    }
}

struct PTView_Previews: PreviewProvider {
    static var previews: some View {
        PTView(ptViewModel: PTViewModel())
    }
}

