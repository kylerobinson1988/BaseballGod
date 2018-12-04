//
//  BaseballEnums.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/4/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation

enum Team: String {
    
    // AL East
    case newYorkYankees = "New York Yankees"
    case bostonRedSox = "Boston Red Sox"
    case baltimoreOrioles = "Baltimore Orioles"
    case torontoBlueJays = "Toronto Blue Jays"
    case tampaBayRays = "Tampa Bay Rays"
    // AL Central
    case chicagoWhiteSox = "Chicago White Sox"
    case minnesotaTwins = "Minnesota Twins"
    case kansasCityRoyals = "Kansas City Royals"
    case clevelandIndians = "Cleveland Indians"
    case detroitTigers = "Detroit Tigers"
    // AL West
    case houstonAstros = "Houston Astros"
    case arlingtonRangers = "Arlington Rangers"
    case oaklandAthletics = "Oakland Athletics"
    case seattleMariners = "Seattle Mariners"
    case losAngelesAngels = "Los Angeles Angels"
    // NL East
    case newYorkMets = "New York Mets"
    case philadelphiaPhillies = "Philadelphia Phillies"
    case washingtonNationals = "Washington Nationals"
    case atlantaBraves = "Atlanta Braves"
    case miamiMarlins = "Miami Marlins"
    // NL Central
    case chicagoCubs = "Chicago Cubs"
    case stLouisCardinals = "St Louis Cardinals"
    case pittsburgPirates = "Pittsburg Pirates"
    case milwaukeeBrewers = "Milwauke Brewers"
    case cincinnatiReds = "Cincinnati Reds"
    // NL West
    case losAngelesDodgers = "Los Angeles Dodgers"
    case sanFranciscoGiants = "San Francisco Giants"
    case sanDiegoPadres = "San Diego Padres"
    case arizonaDiamondbacks = "Arizona Diamondbacks"
    case coloradoRockies = "Colorado Rockies"
    
}

enum Position: String {
    
    case pitcher = "Pitcher"
    case catcher = "Catcher"
    case firstBase = "First Base"
    case secondBase = "Second Base"
    case thirdBase = "Third Base"
    case shortstop = "Shortstop"
    case leftField = "Left Field"
    case centerField = "Center Field"
    case rightField = "Right Field"
    case designatedHitter = "Designated Hitter"
    
}

enum Handedness: String {
    
    case right = "Right"
    case left = "Left"
    case switchHit = "Switch"
    
}
