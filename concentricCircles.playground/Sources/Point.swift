import Foundation


public class Point {
    
    public var x = 0.0
    public var y = 0.0
    
    
    public init() {  }
    public init(x: Double, y:Double) { self.x = x; self.y = y }
    
    public func distance_to(p: Point) -> Double {
        
        let dx = self.x - p.x
        let dy = self.y - p.y
        let d_squared = dx*dx + dy*dy
        return sqrt(d_squared)
        
    }
    
}