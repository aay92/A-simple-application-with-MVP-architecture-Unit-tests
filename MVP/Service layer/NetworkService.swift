//
//  NetworkService.swift
//  MVP
//
//  Created by Aleksey Alyonin on 28.04.2023.
//

import UIKit

protocol NetworkServiceProtocol {
    func getComments(completion: @escaping(Result<[Comment]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data,_ ,error) in
            if let error = error {
                completion(.failure(error))
            }
            do {
                let obj = try JSONDecoder().decode([Comment].self, from: data!)
                ///obj = [Comment] - массив комментов
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}



