//: Playground - noun: a place where people can play


// http://airspeedvelocity.net/2014/06/06/an-accumulator-in-swift-part-2/

// var foo = ["1", "2", "3.1"].map{ $0.doubleValue }


import Foundation



let prog = "1 2 add 3 mul 1 sub 2 div"

let m = StackMachine(program: prog)

m.stringValue()
m.run()
m.stringValue()



/////////



// let s = Stack<Int>()

let s = Stack(data:[2,4,6])

s.top

s[0]
s.count
s.items
// s[0] = 0
s.items


s.push(17)
s.pop()
s.items

s.shift()
s.items
