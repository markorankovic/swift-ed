

import Foundation

class SomeClass {
    
    lazy var number: Int = 5
    
}

let someInstance = SomeClass()

someInstance.number

//: If multiple threads access the lazy property simulataneously before initialization, then there is no guarantee that the property will be initialized only once.

//: ## Computed Properties

class ComputedPropTest {
    var computedProp: Int {
    set {
        self.storedProp = newValue
    }
    get {
        return self.storedProp
    }
    }
    var storedProp = 5 {
        willSet {
            print("Will set storedProp to \(newValue)")
        }
        didSet {
            print("Did set storedProp from \(oldValue) to \(storedProp)")
        }
    }
}

let inst = ComputedPropTest()

inst.storedProp = 8

inst.computedProp

var currentTime: Date {
    get { return Date() }
}


/*:
 Another interesting thing that property observers allows you to do is to ensure that only values within the
 specified valid range is assigned to variables.
 */

struct SomeStruct {
    
    let maxValue = 18
    
    var computedProp: Int {
        set {
            storedProp = newValue
        }
        get {
            return storedProp
        }
    }
    
    var storedProp: Int = 5 {
        willSet {
            print("Setting storedProp to \(newValue)")
        }
        didSet {
            if storedProp > maxValue {
                print("storedProp to cap at \(maxValue)")
                storedProp = maxValue
            }
        }
    }
    
}

var b = SomeStruct()
b.computedProp
b.computedProp = 18
b.computedProp






