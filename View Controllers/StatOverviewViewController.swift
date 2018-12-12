//
//  StatOverviewViewController.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/10/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import UIKit

class StatOverviewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var playerNameLabel: UILabel!
    
    var viewModel: StatOverviewViewModel?
    
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerNameLabel.text = "\(viewModel?.selectedPlayer?.firstName ?? "") \(viewModel?.selectedPlayer?.lastName ?? "")"
        
        tableViewSetup()
        
        loadingIndicator.startAnimating()
        
        viewModel?.getStats(completion: {
            
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
        return viewModel?.stats.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "statCell", for: indexPath) as? StatCell else { return UITableViewCell() }
        
        if let colorForLabel = viewModel?.selectedTeam?.colors, colorForLabel.count > 0 {
            cell.color = colorForLabel[0]
        }
        
        cell.stat = viewModel?.stats[indexPath.row]
        
        return cell
        
    }
    
    func reloadTableView() {
        
        self.tableView.reloadData()
        showHideIndicator(show: false)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        
        performSegue(withIdentifier: "showStatDetailSegue", sender: self)
        
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
        
        guard let statDetailsVC = segue.destination as? StatDetailViewController else { return }
        
        statDetailsVC.viewModel = StatDetailViewModel()
        statDetailsVC.viewModel?.stat = viewModel?.stats[selectedIndex]
        statDetailsVC.viewModel?.textForTopLabel = "\(viewModel?.selectedPlayer?.firstName ?? "") \(viewModel?.selectedPlayer?.lastName ?? "") on \(viewModel?.stats[selectedIndex].dateOfStats ?? "Date N/A")"
        
    }

}

class StatCell: UITableViewCell {
    
    @IBOutlet weak var statDateLabel: UILabel!
    
    var stat: PlayerStats? { didSet { configureCell() } }
    var color: UIColor?
    
    private func configureCell() {
        
        statDateLabel.text = "\(stat?.dateOfStats ?? "Date N/A")"
        statDateLabel.textColor = color != nil ? color : UIColor.black
        
    }
    
}
