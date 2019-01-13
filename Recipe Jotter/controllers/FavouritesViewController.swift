//
//  FavouritesViewController.swift
//  Recipe Jotter
//
//  Created by Sam Blackburn on 11/01/2019.
//  Copyright © 2019 Sam Blackburn. All rights reserved.
//

import UIKit

class FavouritesViewController: BaseViewController {
    
    // MARK: - Interface
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.estimatedRowHeight = UITableView.automaticDimension
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Favourites"
    }

}

extension FavouritesViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Rows
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
