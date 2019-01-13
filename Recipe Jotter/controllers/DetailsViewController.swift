//
//  DetailsViewController.swift
//  Recipe Jotter
//
//  Created by Sam Blackburn on 12/01/2019.
//  Copyright © 2019 Sam Blackburn. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var nameOfDish: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    
    
    var detailRecipe: Recipes? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        if let detailRecipe = detailRecipe {
            if let detailDescriptionLabel = detailDescriptionLabel, let recipeImageView = recipeImageView {
                nameOfDish.text = detailRecipe.name
                recipeImageView.image = UIImage(named: detailRecipe.name)
                title = detailRecipe.typeOfDish
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add button
        let testUIBarButtonItem = UIBarButtonItem(image: UIImage(named: "heart.png"), style: .plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem  = testUIBarButtonItem
        
        configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
