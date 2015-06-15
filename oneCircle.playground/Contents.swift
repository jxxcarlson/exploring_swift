//: Playground - noun: a place where people can play

import UIKit


let Origin = Point()
let C = Circle(center: Origin, radius: 130)



class GraphicsView: UIView {
    
    
    override func drawRect(rect: CGRect) {
        
        C.draw(frame)
    }

}


var view = GraphicsView(frame: CGRectMake(0, 0, 300, 310))
