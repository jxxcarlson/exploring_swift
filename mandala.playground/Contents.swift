

// Jmaes Carlson, June 11, 2015


// Mandala uses the "Dusk" theme in Fonts & colors.  It will not
// look good in a light theme.

// For a discussion of Mandala, see 
//
//    http://www.noteshare.io/section/graphics-101#_drawing_a_ring_of_circles
//
// You ask: where's the code? The code for mandala itself is found
// in Sources/drawings.swift. This code relies on drawingTools.swift
// and on the two class Point and Circle.






import UIKit


class GraphicsView: UIView {
    
    override func drawRect(rect: CGRect) {
        
        mandala1(frame)
        
    }
}


var view = GraphicsView(frame: CGRectMake(0, 0, 300, 310))






