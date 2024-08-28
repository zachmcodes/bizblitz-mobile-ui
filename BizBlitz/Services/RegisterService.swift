//
//  RegisterService.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 8/26/24.
//

import Foundation

class RegisterService {
    
    func registerUser(username: String, email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        let baseURL = "http://localhost:8082"
        guard let url = URL(string: "\(baseURL)/api/bff/users/register") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "username": username,
            "email": email,
            "password": password
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
