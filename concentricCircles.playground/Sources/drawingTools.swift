import UIKit

public func drawCircle(frame: CGRect,  radius: Double) {
    
    let Origin = Point()
    let C = Circle(center: Origin, radius: radius)
    C.draw(frame)
}


public func concentricCircles(frame: CGRect,
  
    radius: Double, n: Int) {
        
        let dr = radius/Double(n)
        var r = radius
        for(var i = 0; i < n; i++) {
            drawCircle(frame, radius: r)
            r = r - dr
        }    
}