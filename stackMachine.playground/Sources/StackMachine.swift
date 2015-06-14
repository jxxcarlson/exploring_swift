public class StackMachine {
    
    let ops = ["add", "mul", "sub", "div"]
    
    var prog: [String]
    
    var instructionPointer = 0
    var error = ""
    
    var stack = Stack<String>()
    
    
    public init(program: String) {
        
        prog = program.componentsSeparatedByString(" ")
        stack = Stack()
    }
    
    
    func load(program: String) {
        
        prog = program.componentsSeparatedByString(" ")
        stack = Stack()
        instructionPointer = 0
        error = ""
    }
    
    public func stringValue() -> String {
        
        var output = "stack: "
        
        if stack.count > 0 {
            for(var i = 0; i < stack.count - 1; i++) {
                output += stack[i] + ", "
            }
            output += stack[stack.count - 1]
        }
        
        output += " - prog: "
        
        for(var i = instructionPointer; i < prog.count; i++) {
            output += prog[i] + ", "
        }
        return output
    }
    
    func executeAdd() {
        
        if stack.count >= 2 {
            let operand1 = stack.pop().doubleValue()
            let operand2 = stack.pop().doubleValue()
            let result = operand1 + operand2
            stack.push(String(result))
        } else {
            error = "add"
        }
        
    }
    
    func executeMul() {
        
        if stack.count >= 2 {
            let operand1 = stack.pop().doubleValue()
            let operand2 = stack.pop().doubleValue()
            let result = operand1 * operand2
            stack.push(String(result))
        } else {
            error = "mul"
        }
        
    }
    
    func executeSub() {
        
        if stack.count >= 2 {
            let operand1 = stack.pop().doubleValue()
            let operand2 = stack.pop().doubleValue()
            let result = operand2 - operand1
            stack.push(String(result))
        } else {
            error = "sub"
        }
        
    }
    
    func executeDiv() {
        
        if stack.count >= 2 {
            let operand1 = stack.pop().doubleValue()
            let operand2 = stack.pop().doubleValue()
            if operand1 != 0 {
                let result = operand2 / operand1
                stack.push(String(result))
            } else {
                error = "division by zero"
            }
        } else {
            error = "div"
        }
        
    }
    
    
    func execute(instruction: String) {
        
        switch instruction {
        case "add": executeAdd()
        case "mul": executeMul()
        case "sub": executeSub()
        case "div": executeDiv()
        default: print("Done")
            
        }
        
    }
    
    public func step() {
        let item = prog[instructionPointer]
        if ops.contains(item) {
            execute(item)
        } else {
            stack.push(item)
        }
        instructionPointer++
        print(stringValue())
    }
    
    
    public func run() -> String {
        while instructionPointer < prog.count && error == ""  {
            step()
        }
        return stack.top
    }
    
}
