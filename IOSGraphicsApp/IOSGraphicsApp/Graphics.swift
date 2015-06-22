//
//  Graphics.swift
//  IOSGraphicsApp
//
//  Created by James Carlson on 6/21/15.
//  Copyright © 2015 James Carlson. All rights reserved.
//

import UIKit

func drawFigure(frame: CGRect) {
    
    let g:CGFloat = 0.85
    let bgColor = UIColor(red: g, green: g, blue: g, alpha: 1.0)
    bgColor.set()
    UIRectFill(frame)

    let S1 = Shape(x: 0, y: 0, width: 200, height: 200)
    let S2 = Shape(x: 100, y: 100, width: 200, height: 200)
    
    S1.draw(frame)
    S2.draw(frame)
    
    
}

class GraphicsView: UIView {
    
    override func drawRect(rect: CGRect) {
        
        drawFigure(frame)
        
    }
    
}


