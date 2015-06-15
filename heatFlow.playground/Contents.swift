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
        sa = sa + [next_state(sa[i-1], k: 0.8)]
    }
    return sa
}

var c1: state = [1.0, 0, 0, 0, 0, 0.3, 0.9, 0.3, 0, 0]
var result = run(c1, n: 10)
for state in result {
    print(state)
}

print(result[0])
result.count
result[0].count

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


class Thermograph2D {
    
    var temperatureArray = stateArray()
    
    init( data: stateArray ) {
        
        temperatureArray = data
    }
    
    
    func draw(frame: NSRect) {
        
        let width = frame.width
        let height = frame.height
        let n_rows = temperatureArray.count
        let n_cols = (temperatureArray[0]).count
        var x = CGFloat(0.0)
        var y = CGFloat(0.0)
        let dx = CGFloat(width/CGFloat(n_cols))
        let dy = CGFloat(height/CGFloat(n_rows))
        
        for (var row  = 0; row < n_rows; row++) {
             x = CGFloat(0.0)
            for (var col = 0; col < n_cols; col++ ) {
                
                let currentRect = NSMakeRect(x, y, dx, dy)
                x = x + dx
                let temperature = CGFloat(temperatureArray[row][col])
                print("t[\(row),\(col)] = \(temperature)")
                let currentColor = NSColor(red: temperature, green: 0.0,
                    blue: 0.0, alpha: 1.0)
                currentColor.set()
                NSRectFill(currentRect)
            }
           
            y = y + dy
        }
    }
    
}



let k = 3


let tg = Thermograph(data:result[k])
// let tg = Thermograph(data:[1, 0.8, 0.6, 0.4, 0.2, 0.0, 0.2, 0.4, 0.6, 0.8, 1.0])
print(tg.temperatureArray)




class GView: NSView {
    
    override func drawRect(dirtyRect: NSRect) {
        
        tg.draw(frame)
    }
}

let view = GView(frame: NSRect(x: 0, y: 0, width: 500, height: 20))


let tg2d = Thermograph2D(data: result)


class GView2D: NSView {
    
    override func drawRect(dirtyRect: NSRect) {
        
        tg2d.draw(frame)
    }
}

let view2D = GView2D(frame: NSRect(x: 0, y: 0, width: 500, height: 500))

