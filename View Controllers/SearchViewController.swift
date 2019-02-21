//
//  SearchViewController.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 2/18/19.
//  Copyright © 2019 Rocktransformed. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var playerTypeSegmentControl: UISegmentedControl!
    @IBOutlet weak var searchResultTableView: UITableView!
    
    @IBOutlet weak var noResultsLabel: UILabel!
    @IBOutlet weak var suggestionLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    var viewModel: SearchViewModel?
    
    var playerIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = SearchViewModel()
        
        tableViewSetup()
        
        showHideNoResultsUI(show: false)
        
    }
    
    func showHideNoResultsUI(show: Bool) {
        
        searchResultTableView.isHidden = show ? true : false
        noResultsLabel.isHidden = show ? false : true
        suggestionLabel.isHidden = show ? false : true
        
    }
    
    // MARK: - UITableView
    
    func tableViewSetup() {
        
        searchResultTableView.dataSource = self
        searchResultTableView.delegate = self
        searchResultTableView.tableFooterView = UIView(frame: CGRect.zero)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.searchResults.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as? PlayerCell else { return UITableViewCell() }
        
        cell.playerNameLabel.text = viewModel?.searchBarInput
        
//        if let colorForLabel = viewModel?.selectedTeam.colors, colorForLabel.count > 0 {
//            cell.color = colorForLabel[0]
//        }
        
//        cell.player = viewModel?.searchResults[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        playerIndex = indexPath.row
        
        performSegue(withIdentifier: "showSearchResultDetailSegue", sender: nil)
        
    }
    
    // MARK: - Search Bar
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        viewModel?.searchBarInput = searchBar.text ?? ""
        
        viewModel?.performSearch(completion: { success in
            
            if success {
                self.showHideNoResultsUI(show: false)
                self.searchResultTableView.reloadData()
            } else {
                self.showHideNoResultsUI(show: true)
            }
            
        })
        
    }
    
    // MARK: - Year Selection

    func yearUpdated(year: Int) {
        
        viewModel?.season = year
        
        yearLabel.text = "\(year)"
        
        if searchBar.text?.isEmpty == false {
            
            viewModel?.performSearch(completion: { success in
                
                if success {
                    self.showHideNoResultsUI(show: false)
                    self.searchResultTableView.reloadData()
                } else {
                    self.showHideNoResultsUI(show: true)
                }
                
            })
            
        }
        
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showSearchResultDetailSegue" {
            
            guard let statVC = segue.destination as? StatViewController else { return }
            
            statVC.viewModel?.stats = viewModel?.searchResults[playerIndex]
            
        } else if segue.identifier == "showYearPickerSegue" {
            
            guard let yearVC = segue.destination as? YearViewController else { return }
            
            yearVC.yearCompletion = { year in self.yearUpdated(year: year) }
            
        }
        
    }

}

