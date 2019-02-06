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
        
        getTeamNameLabel()
        
        if let colors = viewModel?.selectedTeam.colors, colors.count > 1 {
            teamNameLabel.textColor = colors[1]
        }
        
        tableViewSetup()
        
        loadingIndicator.startAnimating()
        
        getPlayersFromModel()
        
    }
    
    func getPlayersFromModel() {
        
        viewModel?.getPlayers(completion: {
            
            DispatchQueue.main.async {
                self.reloadTableView()
            }
            
        })
        
    }
    
    func getTeamNameLabel() {
        
        teamNameLabel.text = "\(viewModel?.year ?? 2019) \(viewModel?.selectedTeam.name ?? "Team Name")"
        
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let scrollViewHeight = scrollView.frame.size.height
        let scrollContentSizeHeight = scrollView.contentSize.height
        let scrollOffset = scrollView.contentOffset.y
        
        if scrollOffset + scrollViewHeight == scrollContentSizeHeight {
            
            getPlayersFromModel()
            
        }
        
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
    
    // MARK: - Actions
    
    @IBAction func pickYearPressed(_ sender: Any) {
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showStatsSegue" {
            
            guard let statVC = segue.destination as? StatViewController else { return }
            guard let selectedPlayer = viewModel?.players[selectedIndex] else { return }
            
            statVC.viewModel = StatViewModel()
            statVC.viewModel?.team = viewModel?.selectedTeam
            statVC.viewModel?.player = selectedPlayer
            statVC.viewModel?.textForTopLabel = "\(selectedPlayer.firstName ?? "") \(selectedPlayer.lastName ?? "")"
            statVC.viewModel?.isPitcher = selectedPlayer.isPitcher
            
        } else {
            
            guard let yearVC = segue.destination as? YearViewController else { return }
            
            yearVC.yearCompletion = { [weak self] year in
                
                self?.viewModel?.year = year

                self?.viewModel?.getPlayers(completion: {
                    
                    DispatchQueue.main.async {
                        self?.getTeamNameLabel()
                        self?.reloadTableView()
                    }
                    
                })
                
            }
            
        }
        
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
