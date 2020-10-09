//
//  NetworkManager.swift
//  Wandio
//
//  Created by Guga Valashvili on 10/8/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import Foundation

class NetworkManager {
    let baseURL: URL
    
    static let shared = NetworkManager(baseURL: URL(string: API.baseURL)!)
    
    private init(baseURL: URL){
        self.baseURL = baseURL
    }
    
    func getRequest<T: Decodable>(_ type: T.Type,  path: String, complition: @escaping (Result<T, Error>) -> Void) {
        let url = baseURL.appendingPathComponent(path)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: URLRequest(url: url), completionHandler: { (data, response, error) -> Void in
            if let data = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let entity = try decoder.decode(type, from: data)
                    DispatchQueue.main.async {
                        complition(.success(entity))
                    }
                } catch {
                    DispatchQueue.main.async {
                        complition(.failure(error))
                    }
                }
            } else {
                DispatchQueue.main.async {
                    complition(.failure(error ?? APIError.networkFail))
                }
            }
        })
        task.resume()
    }
    
    
}
