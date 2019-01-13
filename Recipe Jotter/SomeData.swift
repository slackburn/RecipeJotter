//
//  SomeData.swift
//  Recipe Jotter
//
//  Created by Sam Blackburn on 12/01/2019.
//  Copyright © 2019 Sam Blackburn. All rights reserved.
//

import Foundation

final class SomeData {
    
    static func generateRecipeData() -> [Recipes] { // retrieves variables from class Recipes
        return [ // adds data to the table
            Recipes(name:"Tomato Soup", typeOfDish:"Soup"),
            Recipes(name:"Chicken Pie", typeOfDish:"Chicken"),
            Recipes(name:"Chicken Pasta Bake", typeOfDish:"Pasta"),
            Recipes(name:"Beef Wellington", typeOfDish:"Steak")
        ]
    }
}
