

//: # Closures

/*:
## Closures are blocks of code
 As well as simply being blocks of code, closures also have the posibility to be stored, typed and last but not least passed around through functions.
 */
do {
    let a = 1
    let b = 2
    print(a * b)
}

/*:
 In the case below, the closure **encloses** the return statement inside the getter.
 */
extension Int {
    var isEven: Bool { get { return self % 2 == 0 } }
}

/*:
 ## A function is one case of a closure
 In this case, there is a closure that has the name *getReversed*. This closure knows what types to take in, and which type to return based on the **context** in which it is declared. The closure is declared from outside to take no parameters, but return to an array of elements.
 */

extension Array {
    
    func getReversed() -> [Element] {
        
        var newArr: [Element] = []
        for i in 0..<count {
            newArr.append(self[count - 1 - i])
        }
        return newArr
        
    }
    
}

[1, 2, 3, 4, 5].getReversed()

//: ## Nested functions is an instance of a closure
/*:
 A function inside a function is one case of a closure because a block of code to be executed at specified times and able to capture values from outside that code is enclosed within the outer function.
 Constants *a* and *b* are defined from outside the block in function *mult*, yet *mult* still has access to them.
 */

func evaluateOperands(_ a: Int, _ b: Int) -> Int {
    func mult() -> Int {
        return a * b
    }
    return mult()
}

evaluateOperands(2, 3)


