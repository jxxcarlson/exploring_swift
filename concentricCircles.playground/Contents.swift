//: Playground - noun: a place where people can play

import UIKit




class GraphicsView: UIView {
    
    
    override func drawRect(rect: CGRect) {
        
        let R = Double(frame.size.height/2.3)
        concentricCircles(frame, radius: R, n: 5)
    }

}


var view = GraphicsView(frame: CGRectMake(0, 0, 300, 310))
