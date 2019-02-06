//
//  String.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 2/6/19.
//  Copyright © 2019 Rocktransformed. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func formatForSearch() -> String {
        
        let decapitalized = self.lowercased()
        
        let dashed = decapitalized.replacingOccurrences(of: " ", with: "-")
        
        return dashed
        
    }
    
}
