//
//  Post.swift
//  UpstackDemo
//
//  Created by Djuro Alfirevic on 4/4/19.
//  Copyright © 2019 Djuro Alfirevic. All rights reserved.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
