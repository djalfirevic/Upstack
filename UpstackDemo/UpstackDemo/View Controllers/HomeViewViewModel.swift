//
//  HomeViewViewModel.swift
//  UpstackDemo
//
//  Created by Djuro Alfirevic on 4/4/19.
//  Copyright © 2019 Djuro Alfirevic. All rights reserved.
//

import Foundation

class HomeViewViewModel {
    
    // MARK: - Properties
    var completionHandler: (() -> Void)?
    var posts = [Post]()
    var numberOfRows: Int {
        return posts.count
    }
    
    // MARK: - Public API
    func fetch(from url: String) {
        let decoder = JSONDecoder()
        
        decoder.decode([Post].self, fromURL: url) { [weak self] posts in
            self?.posts = posts
            self?.completionHandler?()
        }
    }
    
    func post(at indexPath: IndexPath) -> Post {
        return posts[indexPath.row]
    }
    
}
