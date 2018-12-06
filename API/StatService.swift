//
//  StatService.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/4/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation

// Token for Stattleship, doesn't seem to work
//let api_accessToken = "61f7a43c9bf26dce4f5f2d0e318cf4f3"

class StatService: NSObject {

    let endpoint = "http://lookup-service-prod.mlb.com"
    
    //"https://api.stattleship.com/baseball/mlb/"
    
    let defaultSession = URLSession(configuration: .default)

    var dataTask: URLSessionDataTask?
    
    var session: URLSession!
    
    // To do: build request method
    
    static func convertDataToJSON(_ data: Data?) {
        
        guard data != nil else { return }

        let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) //as? [String:AnyObject]

        print("~~~~ Output! \(json)")

        print("Zorf would be so proud of you.")
        
    }

    func get40ManRoster(team: Team, season: Int, _ completion: ((Data?, URLResponse?, Error?) -> ())?) {
        
        let requestDetails = "/json/named.roster_team_alltime.bam?start_season='\(season)'&end_season='\(season)'&team_id='\(team.lookupValue)'"
        
        guard let myRequest = URL(string: endpoint + requestDetails) else { return }
        var request = URLRequest(url: myRequest)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        print("~~~ Request Info: \(request.description)")
        
        let session = URLSession.shared
        
        dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard completion != nil else { return }
            completion?(data, response, error)
            
        })
        
        dataTask?.resume()
        
    }
    
    func getTeams(season: Int, _ completion: ((Data?, URLResponse?, Error?) -> ())?) {
        
        let requestDetails = "/json/named.team_all_season.bam?sport_code='mlb'&all_star_sw='N'&sort_order=name_asc&season='\(season)'"
        
        guard let myRequest = URL(string: endpoint + requestDetails) else { return }
        
        var request = URLRequest(url: myRequest)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        print("~~~ Request Info: \(request.description)")
        
        let session = URLSession.shared
        
        dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard completion != nil else { return }
            completion?(data, response, error)
            
        })
        
        dataTask?.resume()
        
    }
    
//    func getPlayer(name: String, _ completion: ((Data?, URLResponse?, Error?) -> ())?) {
//
//        let requestDetails = "/json/named.roster_40.bam?team_id='\(team.lookupValue)'"
//
//        guard let myRequest = URL(string: endpoint + requestDetails) else { return }
//        var request = URLRequest(url: myRequest)
//
//        //        request.addValue("Token token=\(api_accessToken)", forHTTPHeaderField: "Authorization")
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "GET"
//
//        print("~~~ Request Info: \(request.description)")
//
//        let session = URLSession.shared
//
//        dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
//
//            guard completion != nil else { return }
//            completion?(data, response, error)
//
//        })
//
//        dataTask?.resume()
//
//    }
    
    
}

