//
//  Shape.swift
//  IOSGraphicsApp
//
//  Created by James Carlson on 6/21/15.
//  Copyright © 2015 James Carlson. All rights reserved.
//
import UIKit

class Shape: CustomStringConvertible {
    
    var x: Double
    var y: Double
    var width: Double
    var height: Double
    var color: UIColor
    
    init() {
        self.x = 0
        self.y = 0
        self.width = 1
        self.height = 1
        self.color = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    
    init (x: Double, y:  Double, width: Double, height:  Double) {
        
        self.x = x; self.y = y
        self.width = width; self.height = height
        self.color =  UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    
    var description: String {
        
        return "\(width)x\(height) shape at (\(x),\(y))"
    }
    
    func translate(dx dx: Double, dy: Double) {
        
        self.x = self.x + dx
        self.y = self.y + dy
    }
    
    func draw(frame: CGRect) {
        
        let r =  CGRect(x: self.x, y: self.y, width: self.width, height: self.height)
        let context = UIGraphicsGetCurrentContext()
        self.color.set()
        
        CGContextFillRect(context, r)
    }
    
    
}


