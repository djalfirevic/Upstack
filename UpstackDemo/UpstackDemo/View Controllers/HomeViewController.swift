//
//  HomeViewController.swift
//  UpstackDemo
//
//  Created by Djuro Alfirevic on 4/4/19.
//  Copyright © 2019 Djuro Alfirevic. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet private weak var tableView: UITableView!
    var posts = [Post]()
    lazy var viewModel: HomeViewViewModel = {
        let model = HomeViewViewModel()
        model.completionHandler = {
            self.tableView.reloadData()
        }
        
        return model
    }()

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetch(from: Constants.Urls.posts)
        tableView.tableFooterView = UIView()
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.postCell, for: indexPath) as? PostTableViewCell else {
            fatalError("PostTableViewCell is not properly instantiated")
        }
        
        cell.post = viewModel.post(at: indexPath)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
