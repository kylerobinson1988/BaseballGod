//
//  YearViewController.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/17/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import UIKit

class YearViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: YearViewModel?
    
    var yearCompletion: ((Int)->()) = { string in }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = YearViewModel()
        viewModel?.getYears()
        
        tableViewSetup()
        
    }
    
    // MARK: - TableView
    
    func tableViewSetup() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.years.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "yearCell", for: indexPath) as? YearCell else { return UITableViewCell() }
        
        cell.year = viewModel?.years[indexPath.row]
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        let year = viewModel?.years[indexPath.row]
        
        yearCompletion(year ?? 2018)
        
        self.navigationController?.popViewController(animated: true)
        
    }

}

class YearCell: UITableViewCell {
    
    @IBOutlet weak var yearLabel: UILabel!
    
    var year: Int? {
        
        didSet {
            yearLabel.text = "\(year ?? 2018)"
        }
        
    }
    
}
