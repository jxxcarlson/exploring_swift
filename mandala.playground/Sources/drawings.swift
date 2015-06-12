

import UIKit



public func mandala1(frame: CGRect) {
    
    // Constants of proportionality
    let k1 = 20.0, k2 = 0.75
    
    // Radii
    let r1 = Double(frame.height/2.3)
    let r2 = r1/k1
    
    // Outer circle
    drawCircle(frame, radius: r1)
    
    // Inner circles
    concentricCircles(frame, radius: r1/3, n: 7)
 
    // Rings of circles
    drawRing(frame, circleRadius: 3*r2, ringRadius: k2*r1, angle: M_PI/6.0)
    drawRing(frame, circleRadius: 1.5*r2, ringRadius: k2*r1, angle: M_PI/6.0)

}