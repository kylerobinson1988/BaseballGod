//
//  SearchDetailViewController.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 2/22/19.
//  Copyright © 2019 Rocktransformed. All rights reserved.
//

import UIKit

class SearchDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var playerNameLabel: UILabel!
    
    var viewModel: SearchDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelSetup()
        
        viewModel?.getStatsForDisplay()
        
        tableViewSetup()
        
    }
    
    // MARK: - Table View Methods
    
    func labelSetup() {
        
        playerNameLabel.text = viewModel?.textForTopLabel ?? ""
//        playerNameLabel.textColor = viewModel?.team.colors[0]
        
    }
    
    func tableViewSetup() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        reloadTableView()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.statsToDisplay.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "statCell", for: indexPath) as? StatCell else { return UITableViewCell() }
        
        guard let stat = viewModel?.statsToDisplay[indexPath.row] else { return UITableViewCell() }
        
        cell.configureCell(name: stat[0], value: stat[1], color: viewModel?.team?.colors[1])
        
        return cell
        
    }
    
    func reloadTableView() {
        
        self.tableView.reloadData()
        
    }
    
}
