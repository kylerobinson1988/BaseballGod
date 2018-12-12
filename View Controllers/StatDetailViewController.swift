//
//  StatDetailViewController.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/12/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import UIKit

class StatDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var playerNameLabel: UILabel!
    
    var viewModel: StatDetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        playerNameLabel.text = viewModel?.textForTopLabel ?? ""

        tableViewSetup()

        viewModel?.getStatsToDisplay()

        reloadTableView()
        
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
        return viewModel?.statsToDisplay.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "statDetailCell", for: indexPath) as? StatDetailCell else { return UITableViewCell() }
        
        guard let stat = viewModel?.statsToDisplay[indexPath.row] else { return UITableViewCell() }
        
        cell.statNameLabel.text = stat[0]
        cell.statValueLabel.text = stat[1]
        
        return cell
        
    }
    
    func reloadTableView() {
        
        self.tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
  
        
    }


}

class StatDetailCell: UITableViewCell {
    
    @IBOutlet weak var statNameLabel: UILabel!
    @IBOutlet weak var statValueLabel: UILabel!
    
}
