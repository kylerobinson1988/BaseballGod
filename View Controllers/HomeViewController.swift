//
//  HomeViewController.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/4/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        viewModel = HomeViewModel()
        
        viewModel?.getTeams(completion: {
            self.tableView.reloadData()
        })

    }
    
    // MARK: - Table View Methods
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
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
        
    }
    
}
