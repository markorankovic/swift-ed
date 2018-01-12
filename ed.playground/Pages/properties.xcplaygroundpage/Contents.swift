


class SomeClass {
    
    lazy var number: Int = 5
    
}

let someInstance = SomeClass()

someInstance.number

//: If multiple threads access the lazy property simulataneously before initialization, then there is no guarantee that the property will be initialized only once.


