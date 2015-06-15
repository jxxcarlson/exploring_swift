import Cocoa

func drawFigure(frame: NSRect) {
    
    let bgColor = NSColor.blackColor()
    let fgColor = NSColor.redColor()
    let r1 =  NSRect(x: 40, y: 40,
        width: 60, height: 60)
    
    bgColor.setFill()
    NSRectFill(frame)
    
    fgColor.setFill()
    NSRectFill(r1)
}

class GView: NSView {
    override func drawRect(dirtyRect: NSRect) {
        drawFigure(self.frame)
    }
}

let view = GView(frame: NSRect(x: 0, y: 0, width: 300, height: 300))
