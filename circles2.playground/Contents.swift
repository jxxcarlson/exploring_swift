/*
*/

import UIKit


class Shape: CustomStringConvertible {
    
    static var ox = 0.0
    static var oy = 0.0
    
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
        self.color = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
        
    }
    
    init (x: Double, y:  Double, width: Double, height:  Double) {
        
        self.x = x; self.y = y
        self.width = width; self.height = height
        self.color = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
        
    }
    
    var description: String {
        
        return "\(width)x\(height) shape at (\(x),\(y))"
    }
    
    func translate(dx dx: Double, dy: Double) {
        
        self.x = self.x + dx
        self.y = self.y + dy
    }
    
    func dilate(k: Double) {
        
        self.width = k*self.width
        self.height = k*self.height
    }
    
    func draw(frame: CGRect) {
        
        let r =  CGRect(x: self.x + Shape.ox, y: self.y + Shape.oy, width: self.width, height: self.height)
        let context = UIGraphicsGetCurrentContext()
        self.color.set()
        
        CGContextFillRect(context, r)
    }
   
    
    
}


class Circle: Shape {
    
    
    var radius: Double {
        return min(width,height)/2.0
    }
    
    
    override func draw(frame: CGRect) {
        
        let cx = Shape.ox + self.x
        let cy = Shape.oy + self.y
        
        
        let context = UIGraphicsGetCurrentContext()
        self.color.set()
        
        CGContextAddArc(context,
            CGFloat(cx),
            CGFloat(cy),
            CGFloat(self.radius),
            0.0, CGFloat(M_PI * 2.0), 1)
        CGContextFillPath(context)                   }
    
    
}




func drawFigure(frame:CGRect) {
    
    
    
    let d = Double(frame.width)
    let k = 1.2
    let k2 = 0.8
    let d2 = 2*k*d
    let a = CGFloat(0.11)
    let n = 20
    
    
    let bg = Shape(x: 0.0, y: 0.0, width: d, height: d)
    bg.color = UIColor(red: 0, green: 0, blue: 1, alpha: 0.7)
    
   
    
    let S1 = Circle(x: 0, y: 0, width: d2, height: d2)
    S1.color = UIColor(red: 1, green: 0, blue: 0, alpha: a)
    
    let S2 = Circle(x: d, y: d, width: -d2, height: -d2)
    S2.color = UIColor(red: 1, green: 0, blue: 0, alpha: a)
    
    
    Shape.ox = 0.0
    Shape.oy  = 0.0
    
    bg.draw(frame)
    
    Shape.ox = 60.0
    Shape.oy  = 60.0
    
    
    for(var i = 0; i < n; i++) {
        S1.draw(frame)
        S1.dilate(k2)
    }
    
    for(var i = 0; i < n; i++) {
        S2.draw(frame)
        S2.dilate(k2)
    }
}





class GraphicsView: UIView {
    
    override func drawRect(rect: CGRect) {
        
        drawFigure(frame)
        
    }
}

let view = GraphicsView(frame:CGRect(x: 0, y: 0, width: 400, height: 400))








