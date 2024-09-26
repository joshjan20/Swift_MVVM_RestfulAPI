//
//  APIService.swift
//  Swift_MVVM_RestfulAPI
//
//  Created by JJ on 26/09/24.
//

import Foundation

class APIService {
    // Fetch Posts Data from API
    func fetchPosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data)
                completion(.success(posts))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }.resume()
    }
}

