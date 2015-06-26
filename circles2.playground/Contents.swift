/*
*/

import UIKit



class Shape: CustomStringConvertible {
    
    enum Origin {
        
        case corner
        case center
    }
    
    enum DrawMode {
        
        case stroke
        case fill
        case stroke_fill
    }
    
    static var ox = 0.0
    static var oy = 0.0
    static var origin = Origin.corner
    static var masterMode = DrawMode.stroke_fill
    
    
    var x: Double
    var y: Double
    var width: Double
    var height: Double
    
    var color = UIColor.redColor()
    var strokeColor = UIColor.whiteColor()
    var strokeWidth:CGFloat = 1.0
    var mode = Shape.masterMode  // default initialization of mode
    
    
    var x_offset: Double {
        return Shape.origin == .corner ? 0.0 : -width/2.0
    }
    
    var y_offset: Double {
        return Shape.origin == .corner ? 0.0 : -height/2.0
    }
    
    
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
    
    func boundingBox() -> CGRect {
        
        return CGRect(x: self.x + Shape.ox + self.x_offset, y: self.y + Shape.oy + self.y_offset, width: self.width, height: self.height)
    }
  
    func draw(frame: CGRect) {
        
        // let r =  CGRect(x: self.x + Shape.ox + self.x_offset, y: self.y + Shape.oy + self.y_offset, width: self.width, height: self.height)
        
        let r = boundingBox()
        
        let context = UIGraphicsGetCurrentContext()
        
        self.color.set()
        
        
        switch(mode) {
            
        case .fill:
            
            CGContextFillRect(context, r)
            
        case .stroke:
            
            self.strokeColor.set()
            CGContextSetLineWidth(context, strokeWidth)
            CGContextStrokeRect(context, r)
            
        case .stroke_fill:
            
            CGContextFillRect(context, r)
            self.strokeColor.set()
            CGContextSetLineWidth(context, strokeWidth)
            CGContextStrokeRect(context, r)
            
            
        }
    }
    
    
}

class Circle: Shape {
    
    
    var radius: Double {
        return min(width,height)/2.0
    }
    
    
    override func draw(frame: CGRect) {
        
        
        
        let context = UIGraphicsGetCurrentContext()
        
        let cx = self.x + Shape.ox + self.x_offset
        let cy = self.y + Shape.oy + self.y_offset
        
        self.color.set()
       
        
        
        switch(mode) {
            
        case .fill:
            
            
            CGContextAddArc(context,
                CGFloat(cx),
                CGFloat(cy),
                CGFloat(self.radius),
                0.0, CGFloat(M_PI * 2.0), 1)
            CGContextFillPath(context)
            
        case .stroke:
            
            self.strokeColor.set()
            CGContextSetLineWidth(context, strokeWidth)
            
            CGContextAddArc(context,
                CGFloat(cx),
                CGFloat(cy),
                CGFloat(self.radius),
                0.0, CGFloat(M_PI * 2.0), 1)
            CGContextStrokePath(context)

            
        case .stroke_fill:
            
            CGContextAddArc(context,
                CGFloat(cx),
                CGFloat(cy),
                CGFloat(self.radius),
                0.0, CGFloat(M_PI * 2.0), 1)
            CGContextFillPath(context)
            
            self.strokeColor.set()
            CGContextSetLineWidth(context, strokeWidth)
            CGContextStrokePath(context)
        }

        
    }
    
    
}


func drawFigure1(frame:CGRect) {
    
    
    Shape.ox = Double(frame.width/2.0)
    Shape.oy  = Double(frame.height/2.00)
    
    Shape.origin = .center
    let S1 = Circle(x:  0, y: 0, width: 10, height: 10)
    S1.draw(frame)
    
    let S2 = Circle(x:  100, y: 0, width: 50, height: 50)
    S2.draw(frame)

    
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




public func drawFigure3(frame:CGRect) {
    
    let d = Double(frame.width)
    let k = 0.7
    let k2 = 0.87
    let d2 = 2.5*k*d
    let a = CGFloat(0.25)
    let n = 30
    
    let bg = Circle(x: 0.0, y: 0.0, width: d, height: d)
    bg.color = UIColor(red: 0.4, green: 0.3, blue: 0.3, alpha: 1.0)
    bg.mode = .fill
    
    let S1 = Circle(x: 0, y: 0, width: 1.5*d2, height: 1.5*d2)
    S1.color = UIColor(red: 0, green: 0, blue: 1, alpha: a/1.5)
    S1.mode = .fill
    
    
    let S2 = Circle(x: d, y: d, width: -d2, height: -d2)
    S2.color = UIColor(red: 1, green: 0, blue: 0, alpha: a/2)
    S2.mode = .fill
    
    
    bg.draw(frame)
    
    
    for(var i = 0; i < n; i++) {
        S1.draw(frame)
        S1.dilate(k2)
    }
    
    Shape.ox = 30.0
    Shape.oy = 30.0
    
    for(var i = 0; i < n; i++) {
        S2.draw(frame)
        S2.dilate(k2)
    }
    
    Shape.ox = 0
    Shape.oy = 0
    
    
}



class GraphicsView: UIView {
    
    override func drawRect(rect: CGRect) {
        
        drawFigure2(frame)
        
    }
}

let view = GraphicsView(frame:CGRect(x: 0, y: 0, width: 400, height: 400))








