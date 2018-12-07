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
    
    var lookupValue: String {
        
        switch self {
            
        case .losAngelesAngels: return "mlb-laa"
        case .arizonaDiamondbacks: return "mlb-ari"
        case .baltimoreOrioles: return "mlb-bal"
        case .bostonRedSox: return "mlb-bos"
        case .chicagoCubs: return "mlb-chc"
        case .cincinnatiReds: return "mlb-cin"
        case .clevelandIndians: return "mlb-cle"
        case .coloradoRockies: return "mlb-col"
        case .detroitTigers: return "mlb-det"
        case .houstonAstros: return "mlb-hou"
        case .kansasCityRoyals: return "mlb-kc"
        case .losAngelesDodgers: return "mlb-la"
        case .washingtonNationals: return "mlb-was"
        case .newYorkMets: return "mlb-nym"
        case .oaklandAthletics: return "mlb-oak"
        case .pittsburgPirates: return "mlb-pit"
        case .sanDiegoPadres: return "mlb-sd"
        case .seattleMariners: return "mlb-sea"
        case .sanFranciscoGiants: return "mlb-sf"
        case .stLouisCardinals: return "mlb-stl"
        case .tampaBayRays: return "mlb-tb"
        case .arlingtonRangers: return "mlb-tex"
        case .torontoBlueJays: return "mlb-tor"
        case .minnesotaTwins: return "mlb-min"
        case .philadelphiaPhillies: return "mlb-phi"
        case .atlantaBraves: return "mlb-atl"
        case .chicagoWhiteSox: return "mlb-chw"
        case .miamiMarlins: return "mlb-mia"
        case .newYorkYankees: return "mlb-nyy"
        case .milwaukeeBrewers: return "mlb-mil"
            
        }
        
    }
    
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
    
    case right = "right"
    case left = "left"
    case switchHit = "switch"
    
}
