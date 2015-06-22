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

let S1 = ColoredShape(x: 0, y: 0,width: 200, height: 200)
let S2 = ColoredShape(x: 0, y: 0, width: 200, height: 200)
S2.translate(dx: 100, dy: 100)

class GraphicsView: UIView {
    
    override func drawRect(rect: CGRect) {
        
        let g:CGFloat = 0.0
        let bgColor = UIColor(red: g, green: g, blue: g, alpha: 1.0)
        bgColor.set()
        UIRectFill(rect)
        S1.draw(frame)
        S2.draw(frame)
    }
}

let view = GraphicsView(frame:CGRect(x: 0, y: 0, width: 300, height: 300))


