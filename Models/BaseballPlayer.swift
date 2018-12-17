//
//  BaseballPlayer.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/4/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation

struct BaseballPlayer {
    
    var firstName: String?
    var lastName: String?
    var lookupName: String?
    var position: Position?
    var number: String?
    var batsWith: String?
    var throwsWith: String?
    var measurements: String?
    var team: Team?
    var birthday: String?
    var height: Int?
    var weight: Int?
    var winsAboveReplacement: String?
    
    var isPitcher: Bool {
        
        get {
            
            if position == .pitcher || position == .reliefPitcher || position == .startingPitcher {
                return true
            } else {
                return false
            }
        
        }
        
    }
    
    init(dict: [String:Any]) {
        
        firstName = dict["first_name"] as? String
        lastName = dict["last_name"] as? String
        lookupName = dict["slug"] as? String
        position = Position(rawValue: (dict["position_abbreviation"] as? String) ?? "")
        batsWith = dict["bats"] as? String ?? ""
        throwsWith = dict["handedness"] as? String
        number = dict["uniform_number"] as? String
        height = dict["height"] as? Int
        weight = dict["weight"] as? Int
        birthday = dict["birth_date"] as? String
        winsAboveReplacement = dict["war"] as? String
        
    }
    
}
