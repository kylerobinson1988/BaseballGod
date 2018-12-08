//
//  PlayerStats.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/7/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation
import  UIKit

class PlayerStats {
    
    var isPitcher: Bool
    var dateOfStats: String?

    // Pitcher stats
    
    var wildPitches: Int?
    var era: Double?
    var inningsPitched: Double?
    var gamesStarted: Int?
    var gamesPitched: Int?
    var qualityStarts: Int?
    var wins: Int?
    var losses: Int?
    var saves: Int?
    var shutouts: Int?
    var battersFaced: Int?
    var walksAllowed: Int?
    var strikeoutsAllowed: Int?
    var homeRunsAllowed: Int?
    var ballsThrown: Int?
    var strikesThrown: Int?
    
    // Hitter stats
    
    var atBats: Int?
    var battingAverage: Double?
    var walks: Int?
    var singles: Int?
    var doubles: Int?
    var triples: Int?
    var homeRuns: Int?
    var stolenBases: Int?
    var strikeouts: Int?
    var gidp: Int?
    var rbi: Int?
    var slugging: Double?
    var gamesFielded: Int?
    
    init(isPitcher: Bool, infoDict: [String:Any]) {
        
        self.isPitcher = isPitcher
        
        isPitcher ? parseForPitcher(dict: infoDict) : parseForHitter(dict: infoDict)

    }
    
    private func parseForPitcher(dict: [String:Any]) {
        
        dateOfStats = dict["statistics_on"] as? String
        wildPitches = dict["wild_pitches"] as? Int
        era = dict["era"] as? Double
        inningsPitched = dict["innings_pitched"] as? Double
        gamesStarted = dict["games_started"] as? Int
        gamesPitched = dict["games_pitched"] as? Int
        qualityStarts = dict["quality_starts"] as? Int
        wins = dict["wins"] as? Int
        losses = dict["losses"] as? Int
        saves = dict["saves"] as? Int
        shutouts = dict["shutouts"] as? Int
        battersFaced = dict["batters_faced"] as? Int
        walksAllowed = dict["walks_allowed"] as? Int
        strikeoutsAllowed = dict["strikeouts_allowed"] as? Int
        homeRunsAllowed = dict["home_runs_allowed"] as? Int
        ballsThrown = dict["balls_thrown"] as? Int
        strikesThrown = dict["strikes_thrown"] as? Int
        
    }
    
    private func parseForHitter(dict: [String:Any]) {

        dateOfStats = dict["statistics_on"] as? String
        atBats = dict["at_bats"] as? Int
        battingAverage = dict["batting_average"] as? Double
        walks = dict["walks"] as? Int
        singles = dict["singles"] as? Int
        doubles = dict["doubles"] as? Int
        triples = dict["triples"] as? Int
        homeRuns = dict["home_runs"] as? Int
        stolenBases = dict["stolen_bases"] as? Int
        strikeouts = dict["strikeouts"] as? Int
        gidp = dict["ground_outs_into_double_plays"] as? Int
        rbi = dict["rbi"] as? Int
        slugging = dict["slugging_pct"] as? Double
        gamesFielded = dict["fielder_games_played"] as? Int
        
    }
    
}
