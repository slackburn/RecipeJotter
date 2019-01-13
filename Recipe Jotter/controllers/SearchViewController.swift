//
//  SearchViewController.swift
//  Recipe Jotter
//
//  Created by Sam Blackburn on 11/01/2019.
//  Copyright © 2019 Sam Blackburn. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController {
    
    // MARK: - Properties
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchFooter: SearchFooter!
    
    var detailsViewController: DetailsViewController? = nil
    var filteredRecipes = [Recipes]()
    var recipes = SomeData.generateRecipeData() // retrieves data from class generateRecipeData from file SomeData
    let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - View Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Recipes"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        // Setup the search footer
        tableView.tableFooterView = searchFooter

        navigationItem.title = "Search"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let selectionIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectionIndexPath, animated: animated)
        }
    
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Rows
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredRecipes.count
        }
        
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) // identifies cell
        let recipe: Recipes
        if isFiltering() {
            recipe = filteredRecipes[indexPath.row]
        } else {
            recipe = recipes[indexPath.row]
        }
        cell.textLabel!.text = recipe.name // places name as title
        cell.detailTextLabel!.text = recipe.typeOfDish // places type of dish as subtitle
        
        return cell // returns value to be produced in table
    
    }
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail", let destination = segue.destination as? DetailsViewController {
            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
                let recipe = recipes[indexPath.row]
                destination.detailRecipe = recipe
            }
        }
    }
    
    // MARK: - Private instance methods
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredRecipes = recipes.filter({( recipe : Recipes) -> Bool in
            let doesCategoryMatch = (scope == "All") || (recipe.typeOfDish == scope)
            
            if searchBarIsEmpty() {
                return doesCategoryMatch
            } else {
                return doesCategoryMatch && recipe.name.lowercased().contains(searchText.lowercased())
            }
        })
        tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}

extension SearchViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
