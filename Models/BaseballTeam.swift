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
    
    var name: String?
    var colors: [UIColor] = []
    
    init() { }
    
    static func parseFromDict(dict: [String:Any]) -> BaseballTeam {
        
        var newTeam = BaseballTeam()
        
        newTeam.name = "\(dict["name"] as? String ?? "") \(dict["nickname"] as? String ?? "")"
        newTeam.colors = createColorsForTeam(dict["colors"] as? [String] ?? [])
        
        return newTeam
        
    }
    
    private static func createColorsForTeam(_ colors: [String]) -> [UIColor] {
        
        var output: [UIColor] = []
        
        for colorCode in colors {
            
            let newColor = UIColor.fromRGB(colorCode: colorCode)
            output.append(newColor)
            
        }
        
        return output
        
    }
    
}
