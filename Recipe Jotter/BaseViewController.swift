//
//  BaseViewController.swift
//  Recipe Jotter
//
//  Created by Sam Blackburn on 11/01/2019.
//  Copyright © 2019 Sam Blackburn. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add button
        let testUIBarButtonItem = UIBarButtonItem(image: UIImage(named: "plus-simple.png"), style: .plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem  = testUIBarButtonItem
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

}
