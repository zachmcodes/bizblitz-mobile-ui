//
//  LandingViewModel.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 8/26/24.
//

import Foundation
import SwiftUI

class LandingViewModel: ObservableObject {
    @Published var location: String = ""
    @Published var isPressed: Bool = false
    @Published var isHidden: Bool = false
    @Published var shouldTransit: Bool = false
    @Published var selection: String = "None"
    @Published var sortOptions: [String] = ["None", "Rating", "Best Match", "Number of Reviews", "Distance"]
    @Published var searchSelection: String = "Doctors"
    @Published var searchOptions: [String] = ["Doctors", "Urgent Cares", "Emergency", "Chiropractors", "Physical Therapists", "Pharmacies"]
    @Published var isExpanded: Bool = false
    @Published var ptViewModel: PTViewModel = PTViewModel()
}
