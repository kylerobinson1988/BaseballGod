//
//  RosterViewController.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/10/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import UIKit

class RosterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var teamNameLabel: UILabel!
    
    var viewModel: RosterViewModel?

    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamNameLabel.text = viewModel?.selectedTeam.name ?? "Team Name"
        
        if let colors = viewModel?.selectedTeam.colors, colors.count > 1 {
            teamNameLabel.textColor = colors[1]
        }
        
        tableViewSetup()
        
        loadingIndicator.startAnimating()
        
        viewModel?.getPlayers(completion: {
            
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
        return viewModel?.players.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as? PlayerCell else { return UITableViewCell() }
        
        if let colorForLabel = viewModel?.selectedTeam.colors, colorForLabel.count > 0 {
            cell.color = colorForLabel[0]
        }
        
        cell.player = viewModel?.players[indexPath.row]
        
        return cell
        
    }
    
    func reloadTableView() {
        
        self.tableView.reloadData()
        showHideIndicator(show: false)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        
        performSegue(withIdentifier: "showStatsSegue", sender: self)
        
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
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let statVC = segue.destination as? StatOverviewViewController else { return }
        
        statVC.viewModel = StatOverviewViewModel()
        statVC.viewModel?.selectedPlayer = self.viewModel?.players[selectedIndex]
        statVC.viewModel?.selectedTeam = self.viewModel?.selectedTeam
        
    }

}

class PlayerCell: UITableViewCell {
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerPositionLabel: UILabel!
    
//    @IBOutlet weak var backgroundRoundedView: RoundedView!
    
    var color: UIColor?
    var player: BaseballPlayer? { didSet { configureCell() } }
    
    private func configureCell() {
        
        playerNameLabel.text = "\(player?.firstName ?? "") \(player?.lastName ?? "")"
        playerNameLabel.textColor = color != nil ? color : UIColor.black
        playerPositionLabel.text = "\(player?.position?.rawValue ?? "")"
        
    }
    
}
