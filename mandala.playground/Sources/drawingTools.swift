import UIKit


// Draw a large circle, then a circle of given radius
public func drawCircle(frame: CGRect, radius: Double) {
    
    let Origin = Point()
    let C = Circle(center: Origin, radius: radius)
    
    C.draw(frame)
    
}

public func drawCircle(frame: CGRect, x: Double, y: Double, radius: Double) {
    
    let Center = Point(x: x, y: y)
    let C = Circle(center: Center, radius: radius)
    
    C.draw(frame)
    
}


// Draw concentric circle centered at the origin
public func concentricCircles(frame: CGRect, radius: Double, n: Int) {
    
    let dr = radius/Double(n)
    var r = radius
    for(var i = 0; i < n; i++) {
        drawCircle(frame, radius: r)
        r = r - dr
    }
    
}

// Draw concentric circle centered at (x,y)
public func concentricCircles(frame: CGRect, x: Double, y: Double, radius: Double, n: Int) {
    
    let dr = radius/Double(n)
    var r = radius
    for(var i = 0; i < n; i++) {
        drawCircle(frame, x: x, y: y, radius: r)
        r = r - dr
    }
    
}



// Draw a ring of circles
public func drawRing(frame: CGRect) {
    
    let h = Double(frame.size.height)
    let Origin = Point()
    
    // Initial circle of series
    let radius = 22.0;
    let cx = 0.0
    let cy = h/2.3 - radius
    let c = Point(x: cx, y: cy)
    let C = Circle(center: c, radius: radius)
    
    let n = 20
    let theta = 2*M_PI/Double(n)
    
    // Draw ring
    for(var i = 0; i < n; i++) {
        C.draw(frame)
        C.rotate(Origin, angle: theta)
        C.draw(frame)
    }
    
}

// Draw a ring of circles
public func drawRing(frame: CGRect, circleRadius: Double, ringRadius: Double, angle: Double) {
    
    let Origin = Point()
    
    // Initial circle of series
    let radius = circleRadius
    let cx = 0.0
    let cy = ringRadius
    let c = Point(x: cx, y: cy)
    let C = Circle(center: c, radius: radius)
    
    let theta = angle
    let n = Int(trunc(2*M_PI/angle))
    
    // Draw ring
    for(var i = 0; i < n; i++) {
        C.draw(frame)
        C.rotate(Origin, angle: theta)
        C.draw(frame)
    }
    
}