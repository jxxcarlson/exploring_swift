import Foundation

public class Stack<T> {
    
    public var items = [T]()
    
    public init() {
        items = [T]()
    }
    
    public init(data: [T]) {
        items = data
    }
    
    public var top: T {
        return items[items.count - 1]
    }
    
    public var nonempty: Bool {
        return count > 0
    }
    
    public func push(item: T) {
        items.append(item)
    }
    
    public func pop() -> T {
        
        let n = items.count
        return items.removeAtIndex(n-1)
    }
    
    public func shift() -> T {
        return items.removeAtIndex(0)
    }
    
    public var count: Int {
        return items.count
    }
    
    public subscript(i:Int) -> T {
        return items[i]
    }
    
}

public  extension String {
    
    public func doubleValue() -> Double {
        
        return (self as NSString).doubleValue
    }
}
