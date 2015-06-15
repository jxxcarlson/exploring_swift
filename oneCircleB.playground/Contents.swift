//: Playground - noun: a place where people can play

import UIKit

public func drawCircle(frame: CGRect,  radius: Double) {
    let Origin = Point()
    let C = Circle(center: Origin, radius: radius)
    C.draw(frame)
}


class GraphicsView: UIView {
    
    
    override func drawRect(rect: CGRect) {
        let R = Double(frame.size.height/2.3)
        drawCircle(frame, radius: R)
    }

}


var view = GraphicsView(frame: CGRectMake(0, 0, 300, 310))
