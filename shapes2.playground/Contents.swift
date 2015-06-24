/*
*/

import UIKit





class Shape: CustomStringConvertible {
    
    enum OriginLocation {
        
        case corner
        case center
    }
    
    enum DrawMode {
        
        case stroke
        case fill
        case stroke_file
    }

    static var ox = 0.0
    static var oy = 0.0
    static var originLocation = OriginLocation.corner
    
    
    var x: Double
    var y: Double
    var width: Double
    var height: Double
    var color: UIColor
    var strokeColor = UIColor.whiteColor()
    var strokeWidth:CGFloat = 1.0
    var mode = DrawMode.fill
    
    
    var x_offset: Double {
        return (Shape.originLocation == .corner) ? 0.0 : -width/2.0
    }
    
    var y_offset: Double {
        return Shape.originLocation == .corner ? 0.0 : -height/2.0
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
    
    func draw(frame: CGRect) {
        
        let r =  CGRect(x: self.x + Shape.ox + self.x_offset, y: self.y + Shape.oy + self.y_offset, width: self.width, height: self.height)
        let context = UIGraphicsGetCurrentContext()
        
        self.color.set()
        
        
        switch(mode) {
            
        case .fill:
            
            CGContextFillRect(context, r)
            
        case .stroke:
            
            self.strokeColor.set()
            
            CGContextSetLineWidth(context, strokeWidth)
            CGContextStrokeRect(context, r)
            
        default:
            
            CGContextStrokeRect(context, r)
        
        }
    }
    
    
}


func drawFigure(frame:CGRect) {
    
    
    Shape.ox = Double(frame.width/2.0)
    Shape.oy = Double(frame.height/2.0)
    Shape.originLocation = .center
    
    let bg = Shape(x: 0.0, y: 0.0, width: Double(frame.width), height: Double(frame.height))
    bg.color = UIColor(red: 0.5, green: 0, blue: 1, alpha: 1.0)
    
    let S1 = Shape(x: 0, y: 0,width: 100, height: 100)
    S1.mode = .stroke
    let S2 = Shape(x: 0, y: 0, width: 200, height: 200)
    S2.mode = .stroke

    
    bg.draw(frame)
    S1.draw(frame)
    S2.draw(frame)
    
    
}


func drawFigure2(frame:CGRect) {
    
    let d = Double(frame.width)
    let k = 0.9
    let n = 30
    
    Shape.ox = Double(frame.width/2.0)
    Shape.oy = Double(frame.height/2.0)
    Shape.originLocation = .center

    
    let bg = Shape(x: 0.0, y: 0.0, width: d, height: d)
    bg.color = UIColor(red: 0.3, green: 0, blue: 1, alpha: 1.0)
    
    let S1 = Shape(x: 0, y: 0, width: d, height: d)
    S1.strokeColor = UIColor(red: 1.0, green: 0, blue: 1, alpha: 1.0)
    S1.mode = .stroke
    
    
    bg.draw(frame)
    

    
    for(var i = 0; i < n; i++) {
        
        var ii = Double(i + 1)
        var jj = 3.0/sqrt(ii)
        print(jj)
        S1.strokeWidth = CGFloat(jj)

        
        S1.draw(frame)
        S1.dilate(k)
    }
    
    
    
}



func drawFigure3(frame:CGRect) {
    
    let d = Double(frame.width)
    let k = 0.7
    let k2 = 0.87
    let d2 = k*d
    let a = CGFloat(0.25)
    let n = 30
    
    let bg = Shape(x: 0.0, y: 0.0, width: d, height: d)
    bg.color = UIColor(red: 0.4, green: 0.3, blue: 0.3, alpha: 1.0)
    
    let S1 = Shape(x: 0, y: 0, width: 1.5*d2, height: 1.5*d2)
    S1.color = UIColor(red: 0, green: 0, blue: 1, alpha: a/1.5)
  
    
    let S2 = Shape(x: d, y: d, width: -d2, height: -d2)
    S2.color = UIColor(red: 1, green: 0, blue: 0, alpha: a/2)
    
    let S3 = Shape(x: 0, y: 0, width: d/7.0, height: d/7.0)
    S3.color = UIColor(red: 0.4, green: 0.4, blue: 0.6, alpha: 0.5)

    
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
    
    // S3.draw(frame)
    
}




class GraphicsView: UIView {
    
    override func drawRect(rect: CGRect) {
        
        drawFigure(frame)
        
    }
}

let view = GraphicsView(frame:CGRect(x: 0, y: 0, width: 400, height: 400))






