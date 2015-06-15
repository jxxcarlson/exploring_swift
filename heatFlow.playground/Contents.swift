//: Playground - noun: a place where people can play

import Cocoa

typealias state = [Double]
typealias stateArray = [state]

func next_state(x: state, k: Double) -> state {
    
    var y = state(count: x.count, repeatedValue:0.0)
    let lastIndex = x.count - 1
    
    // Boundary conditions:
    y[0] = x[0]
    y[lastIndex] = x[lastIndex]
    for (var i = 1; i < lastIndex; i++) {
        let u = (k/2)*(x[i-1] + x[i + 1])
        let v = (1-k)*x[i]
        y[i] = u + v
    }
    return y
}

func run(initial_state:state, n: Int) -> stateArray {
    var sa:stateArray = [initial_state]
    for(var i = 1; i < n; i++) {
        sa = sa + [next_state(sa[i-1], k: 0.5)]
    }
    return sa
}

var c1: state = [0, 0, 100, 0, 0]
var result = run(c1, n: 4)
for state in result {
    print(state)
}

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



