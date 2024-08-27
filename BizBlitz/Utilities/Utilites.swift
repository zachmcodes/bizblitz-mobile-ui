//
//  Utilites.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 8/22/24.
//

import Foundation
import UIKit
import SwiftUI

func openMapsForDirections(latitude: Double, longitude: Double) {
    let url = URL(string: "maps://?saddr=&daddr=\(latitude),\(longitude)")!
    if UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

func reviewsCount(reviewCount: Int) -> String {
    return "Based on \(reviewCount) reviews"
}

func convertToStandardTime(_ time: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HHmm"
    if let date = dateFormatter.date(from: time) {
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: date)
    } else {
        return time
    }
}
