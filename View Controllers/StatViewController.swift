//
//  StatViewController.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/12/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import UIKit

class StatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var viewModel: StatViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        labelSetup()
        
        showHideIndicator(show: true)
        
        viewModel?.getStats(completion: {
            
            DispatchQueue.main.async {
                self.showHideIndicator(show: false)
                self.tableViewSetup()
            }
            
        })
        
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
    
    // MARK: - Table View Methods
    
    func labelSetup() {
        
        playerNameLabel.text = viewModel?.textForTopLabel ?? ""
        playerNameLabel.textColor = viewModel?.team.colors[0]
        
    }
    
    func tableViewSetup() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        reloadTableView()

    }
    
    func statSetup() {
        
        
        
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
        
        cell.configureCell(name: stat[0], value: stat[1], color: viewModel?.team.colors[1])
        
        return cell
        
    }
    
    func reloadTableView() {
        
        self.tableView.reloadData()
        
    }

}

class StatCell: UITableViewCell {
    
    @IBOutlet weak var statNameLabel: UILabel!
    @IBOutlet weak var statValueLabel: UILabel!
    
    var color: UIColor?
    
    func configureCell(name: String, value: String, color: UIColor?) {
        
        statNameLabel.text = name
        statValueLabel.text = value
        statValueLabel.textColor = color != nil ? color : UIColor.black
        
    }
    
}
