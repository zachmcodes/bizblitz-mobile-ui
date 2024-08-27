//
//  PTDetailView.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 1/5/24.
//

import SwiftUI
import MapKit

struct PTDetailView: View {
    
    let business: Business
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            MapView(business: business)
            BusinessCardView(business: business)
                .offset(y: -40)
            HoursView(business: business)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Provider Details")
                    .foregroundColor(Color(red: 0, green: 0, blue: 0.5))
                    .font(.largeTitle.bold())
                    .accessibilityAddTraits(.isHeader)
            }
        }
    }
}
