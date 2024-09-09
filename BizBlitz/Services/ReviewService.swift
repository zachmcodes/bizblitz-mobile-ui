//
//  ReviewService.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 9/9/24.
//

import Foundation

class ReviewService {
    
    func getUserIdByUsername(username: String, completion: @escaping (Result<Int, Error>) -> Void) {
            let baseURL = "http://localhost:8082"
            guard let url = URL(string: "\(baseURL)/api/bff/users/getByUsername?username=\(username)") else {
                completion(.failure(NetworkError.invalidURL))
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    completion(.failure(NetworkError.noData))
                    return
                }
                do {
                    let user = try JSONDecoder().decode(User.self, from: data)
                    completion(.success(user.id)) // Assuming `User` has an `id` property
                } catch {
                    completion(.failure(NetworkError.decodingFailure(error)))
                }
            }
            task.resume()
        }
    
    func createReview(userId: Int, businessId: String, reviewText: String, rating: Int, completion: @escaping (Result<String, Error>) -> Void) {
        let baseURL = "http://localhost:8082"
        guard let url = URL(string: "\(baseURL)/api/bff/review/create") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "userId": userId,
            "businessId": businessId,
            "reviewText": reviewText,
            "rating": rating
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                completion(.success(responseString))
            } else {
                completion(.failure(NetworkError.decodingFailure(error!)))
            }
        }
        task.resume()
    }
}
