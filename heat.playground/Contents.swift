//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

var c1: [Double] = [100, 0, 0, 0, 0]
var cells2 = [Double](count:5, repeatedValue: 0.0)

typealias state = [Double]
typealias stateArray = [state]

var s1:state = [1.0,2.0,3.0]
var s2:state = [40.0, 50.0, 60.0]

var ss:stateArray = [s1,s2]

ss = ss + [s2]

func next_state(x: state, k: Double) -> state {
    
    var y = state(count: x.count, repeatedValue:0.0)
    let lastIndex = x.count - 1
    
    // Boundary conditions:
    y[0] = x[0]
    y[lastIndex] = x[lastIndex]
    for (var i = 1; i < lastIndex; i++) {
        var u = (k/2)*(x[i-1] + x[i + 1])
        var v = (1-k)*x[i]
        y[i] = u + v
    }
    return y
}

func run(initial_state:state, n: Int) -> stateArray {

    var sa:stateArray = [initial_state]
    for(var i = 1; i < n; i++) {
        sa = sa + [next_state(sa[i-1], 0.5)]
    }
    return sa
}

var c2 = next_state(c1, 0.5)
var c3 = next_state(c2, 0.5)
var c4 = next_state(c3, 0.5)
var c5 = next_state(c4, 0.5)

var result = run(c1, 20)

result[0]
result[1]
result[2]
result[3]
result[4]
result[5]
result[6]
result[7]
result[8]
result[9]
result[10]
result[19]

