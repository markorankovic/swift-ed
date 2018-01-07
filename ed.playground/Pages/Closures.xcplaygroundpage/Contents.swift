

//: # Closures

/*:
## Closures are blocks of code
 As well as simply being blocks of code, closures also have the posibility to be stored, typed and last but not least passed around through functions. The difference between a closure and the *do* block below is that a closure can be stored, and evaluate to a value.
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

//: ## Nested functions as closures
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

//: ## Closure Expressions
/*:
 Closure expressions is the last form of a closure, which is made purely within the brackets. The type of values that the closure will take and the body of the closure is separated by the *in* keyword.
 */
/*:
 Observing the two *equals* functions, we see that the function itself is really defined by the closure. The only difference between a function and a closure expression is that a function has a name to refer to the closure. Both however are two forms of closures.
 */
/*:
 The difference between *equals1* and *equals2* is that the closure of *equals1* has it's parameters defined from within, where as the closure of *equals2* has the parameters defined outside of the closure, but the closure can still capture the arguments since the label has the parameters and return type specified.
 */

let equals1 = { (a: Int, b: Int) -> Bool in return a == b  }
equals1(5, 10)

let equals2: (Int, Int) -> Bool = { return $0 == $1 }
equals2(5, 10)

