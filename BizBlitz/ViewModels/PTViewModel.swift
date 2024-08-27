//
//  PTViewModel.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 1/5/24.
//

import Foundation

class PTViewModel: ObservableObject {
    
    @Published var businesses = [Business]()
    
    func fetchPTData(location: String, query: String, sortType: String) {
        PTService.shared.fetchBffBusinesses(location: location, sortQuery: query, sortType: sortType) { result in
            switch result {
            case .success(let ptDataResult):
                DispatchQueue.main.async {
                    self.businesses = ptDataResult.businesses
                }
            case .failure(let error):
                print("Failed to fetch Physical Therapists data with error \(error)")
            }
        }
    }
}
