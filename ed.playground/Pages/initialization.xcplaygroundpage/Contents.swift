

class A {
    
    var someNum: Int {
        willSet {
            print("willSet called with: \(newValue)")
        }
    }
    
    func output(_ num: Int) -> Int {
        print("Instance method called")
        return num
    }
    
    init(someNum: Int) {
        self.someNum = someNum
        print("willSet not called")
    }
    
}

let a = A(someNum: 10)

a.someNum = 20

//: Setting variables with initializers will not call property observers

a.output(5)

A.output(a)(5)


struct B {
    
    var num: Int?
    
    init(num: Int) {
        self.num = num
    }
    
}

let b = B(num: 8)

b.num

//: Default initialization

struct Car {
    var model = 2018
    var price = 60000
}

let car = Car()



enum HouseMaterial {
    case brick
    case wood
}

struct House {
    
    let yearBuilt: Int
    let material: HouseMaterial
    let area: Int
    
}

extension House {
    
    init(yearBuilt: Int, area: Int) {
        self.yearBuilt = yearBuilt
        self.area = area
        self.material = .wood
    }

}

let house = House(yearBuilt: 2005, area: 832)

house.yearBuilt
house.material
house.area

let house2 = House(yearBuilt: 2011, material: .brick, area: 500)

/*:
 ## Difference between default and memberwise initializer
 The default initializer mostly apply to reference types in which no parameters are required in order to create an instance of the class, but all stored properties must then be initialized at definition.
 The memberwise initializer techinically is a default initializer as it is the initializer handed by default, but this term is used more for value types such as structures. Another thing different about the memberwise initializer is that is has parameters for every stored property that has not been initialized at definition.
*/


class Upper {
    let prop1: Int
    init() {
        prop1 = 1
        print("Upper initialized")
    }
}

class Middle: Upper {
    let prop2: Int
    override init() {
        prop2 = 2
        print("Middle initialized")
    }
}

class Lower: Middle {
    var prop3: Int
    override init() {
        self.prop3 = 3
        print("Lower initialized")
    }
}

let lower = Lower()
lower.prop1
lower.prop2
lower.prop3


class ConvenienceTest {
    var prop1: Int
    var prop2: Int
    var prop3: Int = 7
    init(_ prop1: Int, _ prop2: Int) {
        self.prop1 = prop1
        self.prop2 = prop2
    }
    convenience init() {
        self.init(5, 10)
    }
}

let test = ConvenienceTest()
test.prop1


do {
    
    class A {
        let num: Int
        init(num: Int) {
            self.num = num
        }
    }
    
    class B: A {
        let num2: Int
        override init(num: Int) {
            self.num2 = 10
            super.init(num: num)
        }
        init(num: Int, num2: Int) {
            self.num2 = num2
            super.init(num: num)
        }
        convenience init() {
            self.init(num: 20, num2: 30)
        }
    }
    
    let b = B()
    b.num
    b.num2
    
}


do {
    
    class A {
        var num: Int
        init(num: Int) {
            self.num = num
        }
    }
    
    class B: A {
        var num2: Int
        override init(num: Int) {
            self.num2 = 8
            super.init(num: num)
            printSomething()
        }
        func printSomething() {
            print("Instance method called")
        }
    }
    
    let b = B(num: 5)
    
    b.num
    
}

//: ## Required initializers

do {
    
    class A {
        
        let num: Int
        
        required init(num: Int) {
            self.num = num
        }
        
    }
    
    class B: A {
        
        let num2: Int
        
        required init(num: Int) {
            num2 = 20
            super.init(num: num)
        }
        
    }
    
    let b = B(num: 10)
    
    b.num
    
}


//: ## Failable initializers

do {
    
    class A {
        
        let numOneToTen: Int
        
        init?(numOneToTen: Int) {
            guard numOneToTen > 0 && numOneToTen < 11 else {
                return nil
            }
            self.numOneToTen = numOneToTen
        }
        
    }
    
    let a = A(numOneToTen: 10)
    a
    
    class B: A {
        
        let anyNum: Int
        
        init!(anyNum: Int) {
            self.anyNum = anyNum
            super.init(numOneToTen: 7)
        }
        
    }

    let b = B(anyNum: 4)
    b!.anyNum
    b!.numOneToTen
    
}






