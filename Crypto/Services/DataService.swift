//
//  CoinDataService.swift
//  Crypto
//
//  Created by Sajan Lawrence on 27/09/25.
//

import Foundation
import UIKit

@Observable
class DataService{
    
    func downloadImage(from url: String, completion: @escaping(Result<UIImage, Error>) -> Void){
        guard let url = URL(string: url) else {
            completion(.failure(ImageDownloaderError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else {
                completion(.failure(ImageDownloaderError.invalidResponse))
                return
            }
            
            guard let data = data,
                  let image = UIImage(data: data) else {
                completion(.failure(ImageDownloaderError.invalidData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(image))
            }
        }.resume()
    }
    
    func downloadData<T : Codable>(from url: String, as type: T.Type, completion: @escaping(Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            print(String(data: data!, encoding: .utf8))
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode) else {
                DispatchQueue.main.async {
                    completion(.failure(APIError.invalidResponse))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(APIError.noData))
                }
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decoded))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case noData
}

enum ImageDownloaderError: Error{
    case invalidURL
    case invalidResponse
    case invalidData
}
