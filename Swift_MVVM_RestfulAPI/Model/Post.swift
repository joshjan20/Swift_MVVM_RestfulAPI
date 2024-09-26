//
//  Post.swift
//  Swift_MVVM_RestfulAPI
//
//  Created by JJ on 26/09/24.
//

import Foundation

// Model
struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

