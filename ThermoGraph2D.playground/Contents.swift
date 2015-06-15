//: Playground - noun: a place where people can play

import Cocoa

typealias vector = [Double]
typealias matrix = [vector]

func xrand() -> Double {
    
    let k = arc4random_uniform(100)
    return Double(k)/100.0
}

func randomVector(n: Int) -> vector {
    
    var value = vector()
    for(var i = 0; i < n; i++) {
        value.append(xrand())
    }
    return value
}

func randomMatrix(rows: Int, cols: Int) -> matrix {
    
    var value = matrix()
    for (var row = 0; row < rows; row++) {
        value.append(randomVector(cols))
    }
    return value
}


class Thermograph2D {
    
    var state = matrix()
    
    init( data: matrix ) {
        
        state = data
    }
    
    
    func draw(frame: NSRect) {
        
        let width = frame.width
        let height = frame.height
        let n_rows = state.count
        let n_cols = (state[0]).count
        var x = CGFloat(0.0)
        var y = CGFloat(0.0)
        let dx = CGFloat(width/CGFloat(n_cols))
        let dy = CGFloat(height/CGFloat(n_rows))
        
        for (var row  = 0; row < n_rows; row++) {
            x = CGFloat(0.0)
            for (var col = 0; col < n_cols; col++ ) {
                
                let currentRect = NSMakeRect(x, y, dx, dy)
                x = x + dx
                let temperature = CGFloat(state[row][col])
                let currentColor = NSColor(red: temperature, green: 0.0,
                    blue: 0.0, alpha: 1.0)
                currentColor.set()
                NSRectFill(currentRect)
            }
            
            y = y + dy
        }
    }
    
}

let d = 40

let noise = randomMatrix(d, cols: d)


let tg = Thermograph2D(data:noise)

class GView: NSView {
    override func drawRect(dirtyRect: NSRect) {
        tg.draw(frame)
    }
}
let view = GView(frame: NSRect(x: 0, y: 0, width: 500, height: 500))


