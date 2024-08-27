//
//  LoginService.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 8/26/24.
//

import Foundation

class LoginService {
    
    func fetchLoginAuthentication(username: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        print("login called")
        let baseURL = "http://localhost:8000/"
        guard let url = URL(string: "\(baseURL)api/auth/login") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "username": username,
            "password": password
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                completion(.failure(NetworkError.requestFailed(error!)))
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
