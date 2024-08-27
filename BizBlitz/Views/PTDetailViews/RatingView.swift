//
//  RatingView.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 8/20/24.
//

import SwiftUI

struct RatingView: View {
    
    let rating: Double
    
    var body: some View {
        Image(findRatingImage(rating: rating))
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 0)
    }
}

func findRatingImage(rating: Double) -> String {
    var result = ""
    switch rating {
    case 0.0:
        result = "Review_Ribbon_small_16_0"
    case 0.5..<0.99:
        result = "Review_Ribbon_small_16_half"
    case 1.0..<1.49:
        result = "Review_Ribbon_small_16_1"
    case 1.5..<1.99:
        result = "Review_Ribbon_small_16_2_1_half"
    case 2.0..<2.49:
        result = "Review_Ribbon_small_16_2"
    case 2.5..<2.99:
        result = "Review_Ribbon_small_16_2_half"
    case 3.0..<3.49:
        result = "Review_Ribbon_small_16_3"
    case 3.5..<3.99:
        result = "Review_Ribbon_small_16_3_half"
    case 4.0..<4.49:
        result = "Review_Ribbon_small_16_4"
    case 4.5..<4.99:
        result = "Review_Ribbon_small_16_4_half"
    case 5.0:
        result = "Review_Ribbon_small_16_5"
    default: ""
    }
    return result
}
