//
//  PostTableViewCell.swift
//  UpstackDemo
//
//  Created by Djuro Alfirevic on 4/4/19.
//  Copyright © 2019 Djuro Alfirevic. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    var post: Post? {
        didSet {
            guard let post = post else { return }
            
            titleLabel.text = post.title
            bodyLabel.text = post.body
        }
    }

}
