//
//  PTData.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 1/5/24.
//

import Foundation

struct PTData: Codable {
    let businesses: [Business]
    var average: Double {
        var total = 0.0
        for business in 0..<businesses.count {
            total += businesses[business].rating
        }
        return total / Double(businesses.count)
    }
    var totalWithReview: Int {
        var counter = 0
        for business in 0..<businesses.count {
            if businesses[business].rating > 0 {
                counter += 1
            }
        }
        return counter
    }
    var totalReviews: Int {
        var reviewTotal = 0
        for business in 0..<businesses.count {
            reviewTotal += businesses[business].review_count
        }
        return reviewTotal
    }
}

struct Business: Codable, Identifiable {
    let id: String
    let image_url: String
    let name: String
    let url: String
    let review_count: Int
    let rating: Double
    let coordinates: Coordinates
    let location: Location
    let phone: String
    let display_phone: String
    let business_hours: [BusinessHours]
}

struct BusinessHours: Codable, Hashable {
    let open: [Open]
}

struct Open: Codable, Identifiable, Hashable {
    var id: Int {
        return day
    }
    let start: String
    let end: String
    let day: Int
}

struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double
}

struct Location: Codable {
    let address1: String
    let address2: String?
    let address3: String?
    let city: String
    let zip_code: String
    let country: String
    let state: String
}
