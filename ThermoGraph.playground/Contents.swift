//: Playground - noun: a place where people can play

import Cocoa

class Thermograph {
    
    var temperatureArray = [Double]()
    
    init( data: [Double] ) {
        
        temperatureArray = data
    }
    
    
    func draw(frame: NSRect) {
        
        let width = frame.width
        let height = frame.height
        let n = temperatureArray.count
        var x = CGFloat(0.0)
        let dx = CGFloat(width/CGFloat(n))
        
        for (var i  = 0; i < n; i++) {
            
            let currentRect = NSMakeRect(x, 0, dx, height)
            x = x + dx
            let temperature = CGFloat(temperatureArray[i])
            let currentColor = NSColor(red: temperature, green: 0.0,
                blue: 0.0, alpha: 1.0)
            currentColor.set()
            NSRectFill(currentRect)
        }
    }
    
    
}



let foo = Thermograph(data:[1, 0.8, 0.6, 0.4, 0.2, 0.0, 0.2, 0.4, 0.6, 0.8, 1.0])
print(foo.temperatureArray)



class GView: NSView {
    
    override func drawRect(dirtyRect: NSRect) {
        
        foo.draw(frame)
    }
}

let view = GView(frame: NSRect(x: 0, y: 0, width: 500, height: 50))


