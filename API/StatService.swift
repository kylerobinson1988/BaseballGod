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
    
    // Set the below property to True for stub data
    private var useStubData = true

    private let endpoint = "http://lookup-service-prod.mlb.com"
    
    let defaultSession = URLSession(configuration: .default)

    var dataTask: URLSessionDataTask?
    
    var session: URLSession!
    


    static func convertDataToJSON(_ data: Data?) -> [String:Any] {
        
        guard data != nil else { return [:] }

        do {
            
            let jsonOutput = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String:Any] ?? [:]
            
            print("~~~~ Output! \(jsonOutput)")
            
            return jsonOutput
            
        } catch {
            
            print("An error occurred when converting the data to JSON. Check your filename and try again.")
            return [:]
            
        }
        
    }
    
    private func createResponseFromStubData(fileName: String, _ completion: ((Data?, URLResponse?, Error?) -> ())?) {
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else { return }
        
        let urlResponse = HTTPURLResponse.init(url: URL(string: "https://www.mlb.com")!, statusCode: 200, httpVersion: "", headerFields: nil)
        
        do {
            
            let jsonData = try Data(contentsOf: url)

            completion?(jsonData, urlResponse, nil)

        } catch {
            print("An error occurred when try to convert the JSON data.")
        }
        
    }

    func get40ManRoster(team: Team, season: Int, _ completion: ((Data?, URLResponse?, Error?) -> ())?) {
        
        if useStubData {
            
            createResponseFromStubData(fileName: "Astros40Man") { data, response, error in
                completion?(data, response, error)
            }
            
            return
            
        }
        
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

