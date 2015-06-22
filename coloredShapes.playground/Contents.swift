/*
*/

import UIKit


class Shape: CustomStringConvertible {
    
    var x: Double
    var y: Double
    var width: Double
    var height: Double
    
    
    
    init() {
        self.x = 0
        self.y = 0
        self.width = 1
        self.height = 1
        
    }
    
    init (x: Double, y:  Double, width: Double, height:  Double) {
        
        self.x = x; self.y = y
        self.width = width; self.height = height
        
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
    
    
}


class ColoredShape: Shape {
    
    var color: UIColor
    
    override init() {
        
        self.color = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        super.init()
        
    }
    
    override init (x: Double, y:  Double, width: Double, height:  Double) {
        
        self.color = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.5)
        super.init(x: x, y: y, width: width, height: height)
        
        
    }
    
    func draw(frame: CGRect) {
        
        let r =  CGRect(x: self.x, y: self.y, width: self.width, height: self.height)
        let context = UIGraphicsGetCurrentContext()
        self.color.set()
        
        CGContextFillRect(context, r)
    }
}


func drawFigure(frame: CGRect) {
    
    let background  = ColoredShape(x: 0, y: 0, width: Double(frame.width), height: Double(frame.height))
    let S1 = ColoredShape(x: 0, y: 0, width: 200, height: 200)
    let S2 = ColoredShape(x: 100, y: 100, width : 200, height: 200)
    
    background.draw(frame)
    S1.draw(frame)
    S2.draw(frame)
    
}



class GraphicsView: UIView {
    
    override func drawRect(rect: CGRect) {
        
        drawFigure(frame)
        
    }
    
}


let view = GraphicsView(frame:CGRect(x: 0, y: 0, width: 300, height: 300))


