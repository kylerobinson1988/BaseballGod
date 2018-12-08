//
//  ErrorEnums.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/8/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation

enum WebRequestError: Error {
    
    case invalidResponse(code: Int), emptyDataReturned, serviceError, jsonError
    
    var errorDescription: String {
        
        switch self {
            
        case .invalidResponse: return "The response was invalid and something other than 200."
        case .emptyDataReturned: return "There was no data returned with the response."
        case .serviceError: return "There was an error with the service."
        case .jsonError: return "There was an error returning information from JSON. Check your filename and format and try again."
            
        }
        
    }
    
}
