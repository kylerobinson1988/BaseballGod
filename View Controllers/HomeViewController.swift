//
//  HomeViewController.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/4/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: HomeViewModel?
    
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewSetup()
        
        loadingIndicator.startAnimating()
        
        viewModelSetup()

    }
    
    func viewModelSetup() {
        
        viewModel = HomeViewModel()
        
        viewModel?.getTeams(completion: {
            
            DispatchQueue.main.async {
                self.reloadTableView()
            }
            
        })
        
    }
    
    // MARK: - Table View Methods
    
    func tableViewSetup() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.teams.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as? TeamCell else { return UITableViewCell() }
        
        cell.team = viewModel?.teams[indexPath.row]
        
        return cell
        
    }
    
    func reloadTableView() {
        
        self.tableView.reloadData()
        showHideIndicator(show: false)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        
        performSegue(withIdentifier: "showPlayersSegue", sender: self)
        
    }
    
    func showHideIndicator(show: Bool) {
        
        if show {
          
            loadingIndicator.isHidden = false
            loadingIndicator.startAnimating()
            
        } else {
            
            loadingIndicator.isHidden = true
            loadingIndicator.stopAnimating()
            
        }
        
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let rosterVC = segue.destination as? RosterViewController else { return }
        
        rosterVC.viewModel = RosterViewModel()
        rosterVC.viewModel?.selectedTeam = self.viewModel?.teams[selectedIndex]
        
    }

}

class TeamCell: UITableViewCell {
    
    @IBOutlet weak var teamLogoView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var backgroundRoundedView: RoundedView!
    
    var team: BaseballTeam? { didSet { configureCell() } }
    
    private func configureCell() {
        
        teamLogoView.image = team?.image
        teamNameLabel.text = team?.name
        teamNameLabel.textColor = team?.colors[0]
        
    }
    
}
