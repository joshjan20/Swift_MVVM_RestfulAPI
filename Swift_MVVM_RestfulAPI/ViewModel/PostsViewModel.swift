//
//  PostsViewModel.swift
//  Swift_MVVM_RestfulAPI
//
//  Created by JJ on 26/09/24.
//

import Foundation

class PostsViewModel {
    private var apiService = APIService()
    var posts: [Post] = []  // Data to be displayed in the view
    var reloadTableView: (() -> Void)? // Closure to notify the view to reload data

    // Fetch posts from API
    func fetchPosts() {
        apiService.fetchPosts { [weak self] result in
            switch result {
            case .success(let posts):
                self?.posts = posts
                DispatchQueue.main.async {
                    self?.reloadTableView?() // Notify view to reload table view
                }
            case .failure(let error):
                print("Error fetching posts: \(error)")
            }
        }
    }
}
