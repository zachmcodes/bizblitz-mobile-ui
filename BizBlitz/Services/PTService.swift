//
//  PTService.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 1/5/24.
//

import Foundation

class PTService {
    static let shared = PTService()
    
    func fetchBffBusinesses(location: String, sortQuery: String, sortType: String, completion: @escaping (Result<PTData, Error>) -> Void) {
        guard let url = URL(string: "http://localhost:8082/api/bff/businesses/search") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestBody: [String: String] = [
            "location": location.replacingOccurrences(of: " ", with: "_").lowercased(),
            "sortQuery": sortQuery.lowercased(),
            "sortType": sortType.lowercased()
        ]
        print(requestBody)
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody, options: [])
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(NetworkError.networkFailure(error)))
                return
            }
            guard let safeData = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            do {
                if let jsonString = String(data: safeData, encoding: .utf8) {
                    print("Raw JSON response: \(jsonString)")
                }
                let decodedData = try JSONDecoder().decode(PTData.self, from: safeData)
                completion(.success(decodedData))
            } catch {
                completion(.failure(NetworkError.decodingFailure(error)))
            }
        }
        .resume()
    }
}
