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
    var winsAboveReplacement: String?

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
    
    static func parseFromDict(dict: [String:String]) -> BaseballPlayer {
        
        var newPlayer = BaseballPlayer()
        
        newPlayer.name = dict["name_first_last"]
        newPlayer.position = Position(rawValue: (dict["primary_position"]) ?? "")
        newPlayer.batsWith = Handedness(rawValue: dict["bats"] ?? "")
        newPlayer.throwsWith = Handedness(rawValue: dict["throws"] ?? "")
        newPlayer.measurements = dict["measurements"]
        newPlayer.team = Team(rawValue: dict["team_id"] ?? "")
        newPlayer.birthday = dict["birth_date"]
        newPlayer.winsAboveReplacement = dict["war"]
        
        newPlayer.wins = dict["wins"]
        newPlayer.losses = dict["losses"]
        newPlayer.earnedRunAverage = dict["era"]
        newPlayer.gamesPitched = dict["gamesPitched"]
        newPlayer.gamesStarted = dict["gamesStarted"]
        newPlayer.saves = dict["saves"]
        newPlayer.inningsPitched = dict["inningsPitched"]
        newPlayer.strikeouts = dict["strikeouts"]
        newPlayer.whip = dict["whip"]
        
        // Fielder
        newPlayer.atBats = dict["atBats"]
        newPlayer.hits = dict["hits"]
        newPlayer.runs = dict["runs"]
        newPlayer.battingAverage = dict["battingAverage"]
        newPlayer.homeRuns = dict["homeRuns"]
        newPlayer.runsBattedIn = dict["rbi"]
        newPlayer.stolenBases = dict["sb"]
        newPlayer.onBasePercentage = dict["obp"]
        newPlayer.sluggingPercentage = dict["slg"]
        newPlayer.onBasePlusSlugging = dict["ops"]
        newPlayer.opsPlus = dict["ops+"]
        
        return newPlayer
        
    }
    
}
