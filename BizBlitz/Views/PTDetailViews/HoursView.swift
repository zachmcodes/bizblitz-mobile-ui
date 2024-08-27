//
//  HoursView.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 8/22/24.
//

import SwiftUI

struct HoursView: View {
    
    let business: Business
    
    var body: some View {
        VStack {
            Text("Business Hours")
                .font(.headline)
                .padding(.bottom, 4)
            ForEach(business.business_hours, id: \.self) { hours in
                ForEach(hours.open) { hour in
                    HStack {
                        Text(K.Hours.dayIdtoDay[hour.day]!)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .frame(width: 100, alignment: .leading)
                        Text("\(convertToStandardTime(hour.start)) - \(convertToStandardTime(hour.end))")
                    }
                }
            }
        }
        .padding()
    }
}
