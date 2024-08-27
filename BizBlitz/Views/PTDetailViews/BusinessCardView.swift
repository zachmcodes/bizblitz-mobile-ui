//
//  BusinessCardView.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 8/22/24.
//

import SwiftUI

struct BusinessCardView: View {
    
    let business: Business
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.orange, lineWidth: 0)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                .shadow(radius: 5)
            GeometryReader { geometry in
                HStack(alignment: .top, spacing: 10) {
                    AsyncImage(url: URL(string: business.image_url)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width * 0.3)
                                .cornerRadius(10, corners: [.topLeft, .bottomLeft])
                                .clipped()
                        } else if phase.error != nil {
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.3)
                                .foregroundColor(.gray)
                        } else {
                            ProgressView()
                                .frame(width: geometry.size.width * 0.3)
                        }
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        NavigationLink(business.name, destination: PTSiteView(url: business.url))
                            .font(.title)
                            .foregroundColor(.blue)
                            .frame(maxWidth: 300)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        Button(action: {
                            openMapsForDirections(latitude: business.coordinates.latitude, longitude: business.coordinates.longitude)
                        }) {
                            VStack(alignment: .leading) {
                                Text("Address:")
                                    .underline()
                                    .bold()
                                    .font(.system(size: 12))
                                
                                Text(business.location.address1)
                                    .font(.system(size: 12))
                                Text("\(business.location.city), \(business.location.state) \(business.location.zip_code)")
                                    .font(.system(size: 12))
                            }
                        }
                        .foregroundColor(.black)
                        HStack {
                            Image(systemName: "phone")
                            Link(business.display_phone, destination: URL(string: "tel:"+business.phone)!)
                                .foregroundColor(.blue)
                            
                        }
                        .font(.system(size: 14))
                        HStack {
                            BizBlitz.RatingView(rating: business.rating)
                            Text(String(business.rating))
                        }.padding(.bottom, -10)
                        HStack{
                            Text(reviewsCount(reviewCount: business.review_count))
                                .foregroundColor(.gray)
                                .font(.subheadline)
                                .padding(.leading, -1)
                        }
                        NavigationLink(destination: PTSiteView(url: business.url)) {
                            Image("yelp_logo_cmyk")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.top, 20)
                    }
                    .frame(width: geometry.size.width * 0.65, height: geometry.size.height)
                }
            }
        }
        .frame(maxWidth: 415, maxHeight: 230)
    }
}
