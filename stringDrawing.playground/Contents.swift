import Cocoa

func drawFigure(frame:NSRect) {
    
    let bgColor = NSColor.blackColor()
    bgColor.setFill()
    NSRectFill(frame)
    
    let strokeColor = NSColor.redColor()
    strokeColor.setStroke()
    let bezierPath = NSBezierPath()
    
    bezierPath.moveToPoint(
        NSPoint(x: 10 , y: 10))
    
    for i in 0..<25 {
        bezierPath.lineToPoint(
            NSPoint(x: 20 + 10*(25-i),
                y: 20 + 10 * i))
        bezierPath.moveToPoint(
            NSPoint(x: 10 + 10*i, y: 10 ))
    }
    
    bezierPath.stroke()
}


class GView: NSView {
    
    override func drawRect(dirtyRect: NSRect) {
        drawFigure(frame)
    }
}

var view = GView(frame: NSRect(x: 0, y: 0, width: 300, height: 300))