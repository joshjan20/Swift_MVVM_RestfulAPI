//
//  PostsViewController.swift
//  Swift_MVVM_RestfulAPI
//
//  Created by JJ on 26/09/24.
//

import UIKit

class PostsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var viewModel = PostsViewModel() // ViewModel instance
    private var postsView: PostsView! // Reference to the custom view
    
    override func loadView() {
        postsView = PostsView() // Assign the custom view
        self.view = postsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
        
        setupTableView()
        setupBindings()
        
        // Fetch posts via ViewModel
        viewModel.fetchPosts()
    }
    
    private func setupTableView() {
        postsView.tableView.delegate = self
        postsView.tableView.dataSource = self
        postsView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupBindings() {
        // Bind the ViewModel's reload closure to reload the table view
        viewModel.reloadTableView = { [weak self] in
            self?.postsView.tableView.reloadData()
        }
    }

    // MARK: - UITableView DataSource Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let post = viewModel.posts[indexPath.row]
        cell.textLabel?.text = post.title
        return cell
    }
}
