//
//  K.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 8/22/24.
//

import Foundation

struct K {
    
    struct Service {
        static let baseURL = "https://api.yelp.com/v3/businesses/search?term="
        static let Key = "API_KEY"
        static let requestType = "GET"
        static let header: [String: String] = [
            "key": "Bearer ",
            "value": "Authorization"
        ]
        static let sortedQuery: [String: String] = [
            "None": "",
            "Rating": "&sort_by=rating",
            "Best Match": "&sort_by=best_match",
            "Number of Reviews": "&sort_by=review_count",
            "Distance": "&sort_by=distance"
        ]
        static let sortedType: [String: String] = [
            "Doctors": "doctors&location=",
            "Urgent Cares": "urgent_cares&location=",
            "Emergency": "emergency_rooms&location=",
            "Chiropractors": "chiropractors&location=",
            "Physical Therapists": "physical_therapists&location=",
            "Pharmacies": "pharmacies&location="
        ]
    }
    
    struct Hours {
        static let dayIdtoDay: [Int: String] = [
            0: "Monday",
            1: "Tuesday",
            2: "Wednesday",
            3: "Thursday",
            4: "Friday",
            5: "Saturday",
            6: "Saturday"
        ]
    }
}
