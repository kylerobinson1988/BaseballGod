//
//  BaseballPlayer.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/4/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation

struct BaseballPlayer {
    
    var name: String?
    var position: Position?
    var batsWith: Handedness?
    var throwsWith: Handedness?
    var measurements: String?
    var team: Team?
    var birthday: String?
    var draft: String?
    var winsAboveReplacement: Double?

    // Pitcher
    var wins: Int?
    var losses: Int?
    var earnedRunAverage: Double?
    var gamesPitched: Int?
    var gamesStarted: Int?
    var saves: Int?
    var inningsPitched: Double?
    var strikeouts: Int?
    var whip: Double?
    
    // Fielder
    var atBats: Int?
    var hits: Int?
    var runs: Int?
    var battingAverage: Double?
    var homeRuns: Int?
    var runsBattedIn: Int?
    var stolenBases: Int?
    var onBasePercentage: Double?
    var sluggingPercentage: Double?
    var onBasePlusSlugging: Double?
    var opsPlus: Int?
    
    init() {
        
        
        
    }
    
    mutating func parseFromDict(dict: [String:Any?]) {
        
        name = dict["name"] as? String
        position = Position(rawValue: (dict["position"] as? String ?? ""))
        batsWith = Handedness(rawValue: dict["batsWith"] as? String ?? "")
        throwsWith = Handedness(rawValue: dict["throwsWith"] as? String ?? "")
        measurements = dict["measurements"] as? String
        team = Team(rawValue: dict["team"] as? String ?? "")
        birthday = dict["birthday"] as? String
        draft = dict["draft"] as? String
        winsAboveReplacement = dict["war"] as? Double
        
        wins = dict["wins"] as? Int
        losses = dict["losses"] as? Int
        earnedRunAverage = dict["era"] as? Double
        gamesPitched = dict["gamesPitched"] as? Int
        gamesStarted = dict["gamesStarted"] as? Int
        saves = dict["saves"] as? Int
        inningsPitched = dict["inningsPitched"] as? Double
        strikeouts = dict["strikeouts"] as? Int
        whip = dict["whip"] as? Double
        
        // Fielder
        atBats = dict["atBats"] as? Int
        hits = dict["hits"] as? Int
        runs = dict["runs"] as? Int
        battingAverage = dict["battingAverage"] as? Double
        homeRuns = dict["homeRuns"] as? Int
        runsBattedIn = dict["rbi"] as? Int
        stolenBases = dict["sb"] as? Int
        onBasePercentage = dict["obp"] as? Double
        sluggingPercentage = dict["slg"] as? Double
        onBasePlusSlugging = dict["ops"] as? Double
        opsPlus = dict["ops+"] as? Int
        
    }
    
}
