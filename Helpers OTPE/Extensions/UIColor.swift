//
//  UIColor.swift
//  BaseballGod
//
//  Created by Kyle Brooks Robinson on 12/7/18.
//  Copyright © 2018 Rocktransformed. All rights reserved.
//
// Based on this method: https://manuelbaumann.com/2016/03/initialize-uicolor-rgb-hex-swift/

import Foundation
import UIKit

extension UIColor {
    
    static func fromRGB(colorCode: String, alpha: Float = 1.0) -> UIColor {
        let scanner = Scanner(string:colorCode)
        var color:UInt32 = 0;
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = CGFloat(Float(Int(color >> 16) & mask)/255.0)
        let g = CGFloat(Float(Int(color >> 8) & mask)/255.0)
        let b = CGFloat(Float(Int(color) & mask)/255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: CGFloat(alpha))
        
    }
    
    static func fromRGB(colorCode: UInt) -> UIColor {
        
        let mask = 0x000000FF
        let r = CGFloat(Float(Int(colorCode >> 16) & mask)/255.0)
        let g = CGFloat(Float(Int(colorCode >> 8) & mask)/255.0)
        let b = CGFloat(Float(Int(colorCode) & mask)/255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: CGFloat(1.0))
        
    }
    
}
