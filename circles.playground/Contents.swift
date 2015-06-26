/*
*/

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
    
    func moveto(x x: Double, y: Double) {
        
        self.x = x; self.y = y
    }
    
    func setBox(width width: Double, height: Double) {
        
        self.width = width; self.height = height
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
        
        let r =  CGRect(x: self.x, y: self.y, width: self.width, height: self.height)
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
        
        
        let context = UIGraphicsGetCurrentContext()
        self.color.set()
        
        CGContextAddArc(context,
            CGFloat(self.x),
            CGFloat(self.y),
            CGFloat(self.radius),
            0.0, CGFloat(M_PI * 2.0), 1)
        CGContextFillPath(context)                   }
    
    
}

func drawFigure1(frame:CGRect) {
    
    let d = Double(frame.width)
    
    let bg = Shape(x: 0.0, y: 0.0, width: d, height: d)
    bg.color = UIColor.blackColor()

    let S = Circle(x: 0, y: 0, width: d, height: d)
    S.color = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
    
    
    bg.draw(frame)
    S.draw(frame)
    S.translate(dx: d, dy: d)
    S.draw(frame)
    
    /*
    S.translate(dx: -d/2.0, dy: -d/2.0)
    S.draw(frame)
    S.dilate(0.4)
    S.draw(frame)
*/
    
    /*
    S.moveto(x: d, y: 0)
    S.setBox(width: d, height: d)
    S.draw(frame)
    S.translate(dx: -d, dy: d)
    S.draw(frame)
*/
    
    
    
    
}



func drawFigure2(frame:CGRect) {
    
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
    
    bg.draw(frame)
    
    
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
        
        drawFigure1(frame)
        
    }
}

let view = GraphicsView(frame:CGRect(x: 0, y: 0, width: 300, height: 300))






