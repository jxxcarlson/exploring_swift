

import UIKit


public enum drawMode {
    
    case Fill
    case Stroke
    case Both
}


public class Circle{
    
    public var center = Point()
    public var radius = 0.0
    public var strokeColor = UIColor.blueColor()
    public var lineWidth = 2.0
    
    
    
    public init() { }
    
    public init( center: Point, radius: Double) {
        self.center = center
        self.radius = radius
    }
    
    public func includes_point(P: Point) -> Bool {
        if self.center.distance_to(P) <= self.radius {
            return true
        } else {
            return false
        }
    }
    
    public func overlaps(C: Circle) -> Bool {
        let sum_of_radii = self.radius + C.radius
        if self.center.distance_to(C.center) < sum_of_radii {
            return true
        } else {
            return false
        }
    }
    
    public func rotate(center: Point, angle: Double)  {
        
        let dx = (cos(angle) - 1)*self.center.x + sin(angle)*self.center.y
        let dy = -sin(angle)*self.center.x + (cos(angle) - 1)*self.center.y
        self.center.x += dx
        self.center.y += dy
        
    }
    
    public func translate(dx: Double, dy: Double)  {
        
        self.center.x += dx
        self.center.y += dy
        
    }
    
    public func draw(frame: CGRect) {
        
        let ox = frame.size.width/2
        let oy = frame.size.height/2
        
        let context = UIGraphicsGetCurrentContext()
        
        self.strokeColor.set()
        CGContextSetLineWidth(context, CGFloat(self.lineWidth))
        
        CGContextAddArc(context,
            CGFloat(self.center.x) + ox,
            CGFloat(self.center.y) + oy,
            CGFloat(self.radius),
            0.0, CGFloat(M_PI * 2.0), 1)
        
            CGContextStrokePath(context)
        
    }
    
}

