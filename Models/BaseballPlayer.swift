//
//  BaseballPlayer.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/4/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation

struct BaseballPlayer {
    
    var fullName: String?
    var firstName: String?
    var lastName: String?
    var position: Position?
    var number: String?
    var batsWith: Handedness?
    var throwsWith: Handedness?
    var measurements: String?
    var team: Team?
    var birthday: String?
    var height: String?
    var weight: String?
    var winsAboveReplacement: String?
    
    var lookupName: String? { get { return "mlb-\(firstName ?? "none")-\(lastName ?? "none")" } }
    
    // Pitcher
    var wins: String?
    var losses: String?
    var earnedRunAverage: String?
    var gamesPitched: String?
    var gamesStarted: String?
    var saves: String?
    var inningsPitched: String?
    var strikeouts: String?
    var whip: String?
    
    // Fielder
    var atBats: String?
    var hits: String?
    var runs: String?
    var battingAverage: String?
    var homeRuns: String?
    var runsBattedIn: String?
    var stolenBases: String?
    var onBasePercentage: String?
    var sluggingPercentage: String?
    var onBasePlusSlugging: String?
    var opsPlus: String?
    
    init() { }
    
    static func parseFromDict(dict: [String:Any]) -> BaseballPlayer {
        
        var newPlayer = BaseballPlayer()
        
        newPlayer.firstName = dict["first_name"] as? String ?? ""
        newPlayer.lastName = dict["last_name"] as? String ?? ""
        newPlayer.fullName = "\(dict["first_name"] as? String ?? "") \(dict["last_name"] as? String ?? "")"
        newPlayer.position = Position(rawValue: (dict["position_name"] as? String) ?? "")
        newPlayer.batsWith = Handedness(rawValue: dict["bats"] as? String ?? "")
        newPlayer.throwsWith = Handedness(rawValue: dict["handedness"] as? String ?? "")
        newPlayer.number = dict["uniform_number"] as? String
        newPlayer.height = "\(dict["height"] as? Int ?? 0) inches"
        newPlayer.weight = "\(dict["weight"] as? Int ?? 0) pounds"
        newPlayer.birthday = dict["birth_date"] as? String
        newPlayer.winsAboveReplacement = dict["war"] as? String
        
        newPlayer.wins = dict["wins"] as? String
        newPlayer.losses = dict["losses"] as? String
        newPlayer.earnedRunAverage = dict["era"] as? String
        newPlayer.gamesPitched = dict["gamesPitched"] as? String
        newPlayer.gamesStarted = dict["gamesStarted"] as? String
        newPlayer.saves = dict["saves"] as? String
        newPlayer.inningsPitched = dict["inningsPitched"] as? String
        newPlayer.strikeouts = dict["strikeouts"] as? String
        newPlayer.whip = dict["whip"] as? String
        
        // Fielder
        newPlayer.atBats = dict["atBats"] as? String
        newPlayer.hits = dict["hits"] as? String
        newPlayer.runs = dict["runs"] as? String
        newPlayer.battingAverage = dict["battingAverage"] as? String
        newPlayer.homeRuns = dict["homeRuns"] as? String
        newPlayer.runsBattedIn = dict["rbi"] as? String
        newPlayer.stolenBases = dict["sb"] as? String
        newPlayer.onBasePercentage = dict["obp"] as? String
        newPlayer.sluggingPercentage = dict["slg"] as? String
        newPlayer.onBasePlusSlugging = dict["ops"] as? String
        newPlayer.opsPlus = dict["ops+"] as? String
        
        return newPlayer
        
    }
    
}
