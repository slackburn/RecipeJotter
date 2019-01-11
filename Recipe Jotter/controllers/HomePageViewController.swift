//
//  HomePageViewController.swift
//  Recipe Jotter
//
//  Created by Sam Blackburn on 11/01/2019.
//  Copyright © 2019 Sam Blackburn. All rights reserved.
//

import UIKit

class HomePageViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.title = "Home"
        
    }

    @IBAction func addBtnPressed(_ sender: UIBarButtonItem) {
    }

}

extension HomePageViewController: UITableViewDataSource {
    
    // MARK: - Rows
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
