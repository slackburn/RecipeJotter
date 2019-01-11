//
//  HomePageViewController.swift
//  Recipe Jotter
//
//  Created by Sam Blackburn on 11/01/2019.
//  Copyright © 2019 Sam Blackburn. All rights reserved.
//

import UIKit

class HomePageViewController: BaseViewController {

    // MARK: - Interface
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.estimatedRowHeight = UITableView.automaticDimension
            tableView.register(UINib.init(nibName: "WelcomeScreenTableViewCell", bundle: nil), forCellReuseIdentifier: "WelcomeScreenTableViewCell")
            tableView.register(UINib.init(nibName: "FoodImageTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodImageTableViewCell")
        }
    }
    
    // MARK: - Properties
    fileprivate var headerTitle: [String] = []
    fileprivate var tableViewCells: [IndexPath] = []
    fileprivate let welcomeScreenCellIndexPath             = IndexPath(row: 0, section: 0)
    fileprivate let foodImageCellIndexPath                 = IndexPath(row: 0, section: 1)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
    }
    
    func setUpData() {
        navigationItem.title = "Home"
        tableViewCells = [welcomeScreenCellIndexPath, foodImageCellIndexPath]
        headerTitle = ["Welcome", "Try:"]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
}

extension HomePageViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Rows
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewCells.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "Futura", size: 13)
        header.textLabel?.textColor = UIColor.gray
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitle[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // welcome screen details
        if indexPath == welcomeScreenCellIndexPath, let cell = tableView.dequeueReusableCell(withIdentifier: "WelcomeScreenTableViewCell") as? WelcomeScreenTableViewCell {
            cell.selectionStyle = .none
            return cell
        }
        
        // signature food dish
        if indexPath == foodImageCellIndexPath, let cell = tableView.dequeueReusableCell(withIdentifier: "FoodImageTableViewCell") as? FoodImageTableViewCell {
            cell.selectionStyle = .none
            return cell
        }
        
        return UITableViewCell()
    }
    
}
