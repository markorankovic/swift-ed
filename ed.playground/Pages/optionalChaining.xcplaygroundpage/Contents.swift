


import Foundation

//: # Optional Chaining
/*:
 Refers to the act of attempting to call a property, method or subscript within an optional, and if that optional is *nil* the program does not crash
 as opposed to if an unwrapping was carried out.
*/

class A {
    
    func printSuccess() {
        print("Method called")
    }
    
}

let a: A? = A()
a?.printSuccess()

//: In the above case a *?* comes after the identifier to specify an attempt to access something within the stored value that might just be *nil*.

do {
    
    class C {
        
        let number: Int
        
        init?(number: Int) {
            if (number > 6) {
                print(number)
                return nil
            }
            self.number = number
        }
        
    }
    
    class A {
        func getNewC() -> C? {
            return C(number: Int(arc4random_uniform(10)))
        }
    }
    
    class B {
        let a: A? = A()
    }
    
    let b = B()
    b.a?.getNewC()?.number
    
}






