//
//  RoundedView.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/10/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class RoundedView: UIView {
    
    @IBInspectable var radius: CGFloat = 15 {
        
        didSet {
            
            self.layer.cornerRadius = radius
            self.layer.masksToBounds = true
            
        }
        
    }
    
}
