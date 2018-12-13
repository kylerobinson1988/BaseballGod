//
//  BaseballTeam.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/7/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation
import  UIKit

struct BaseballTeam {
    
    var team: Team?
    var name: String? { get { return team?.displayName ?? "N/A" } }
    var lookupName: String? { get { return team?.rawValue }}
    var colors: [UIColor] = []
    var image: UIImage? { get { return UIImage(named: team?.rawValue ?? "") } }
    
    init(dict: [String:Any]) {
        
        team = Team(rawValue: dict["slug"] as? String ?? "")
        colors = createColorsForTeam(dict["colors"] as? [String] ?? [])
        
    }
    
    private func createColorsForTeam(_ colors: [String]) -> [UIColor] {
        
        let output: [UIColor] = colors.map {
            
            return UIColor.fromRGB(colorCode: $0)
            
        }
        
        return output
        
    }
    
}
