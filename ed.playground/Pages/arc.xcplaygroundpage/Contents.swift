

//: # Automatic Reference Counting
//: The application's memory usage is monitored and managed by ARC. Most of the time the ARC handles all the memory management without the developer's concern, however in some instances parts of the code that have some special relationship may need the developer to provide extra information to the ARC.

//: When creating instances of classes, the ARC ensures that each instance is referred to at least once. Otherwise, the instance is deinitialized from the memory. If the reference itself is not active, the ARC will also deinitialize the instance, unless the reference is a strong reference which it is by default. In this case the ARC will not deinitialize the instance until there are no references to that instance.

do {

class Person {

    let name: String
    var house: House?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("\(self.name) deleted")
    }

}

class House {

    let area: Double
    let type: String
    let propertyPrice: Double
    var owner: Person?

    init(area: Double, type: String, propertyPrice: Double) {
        self.area = area
        self.type = type
        self.propertyPrice = propertyPrice
    }

    deinit {
        print("House deleted")
    }

}

var john: Person? = Person(name: "John")

var johnsHouse: House? = House(area: 100, type: "Detached House", propertyPrice: 300000)

//: If two instances have internal strong references to one another, that will lead to what is called a strong reference cycle and the ARC will not be able to deinitialize either of the instances.

john!.house = johnsHouse
johnsHouse!.owner = john

john = nil
johnsHouse = nil

//: In the above example, john and johnsHouse no longer refer to the instances of Person and House respectively, but the instances still have properties referencing one another. Because of this, neither instances are ever deinitialized.

}

do {
    
    class Person: CustomStringConvertible {

        let name: String
        var house: House?

        init(name: String) {
            self.name = name
        }

        deinit {
            print("\(self.name) deleted")
        }

        var description: String {
            return self.name
        }

    }
    
    class House {
        
        let area: Double
        let type: String
        let propertyPrice: Double
        weak var owner: Person?
        
        init(area: Double, type: String, propertyPrice: Double) {
            self.area = area
            self.type = type
            self.propertyPrice = propertyPrice
        }
        
        deinit {
            print("House deleted")
        }
        
    }
    
    var john: Person? = Person(name: "John")
    
    var johnsHouse: House? = House(area: 100, type: "Detached House", propertyPrice: 300000)
    
    john!.house = johnsHouse
    johnsHouse!.owner = john
    
    print(johnsHouse!.owner!)
    
    john = nil
    
    johnsHouse?.owner
    
    johnsHouse = nil

}

//: As seen above, when one reference to john within johnsHouse is weak, then setting john to nil deinitializes the instance altogether.

//: ## Unowned references
//: Used when making a reference to an instance that has another reference which is either has the same or longer lifetime.

class Consumer {

    var coke: Coke?

    init() {

    }
    
    deinit {
        print("Consumer deleted")
    }

}

class Coke {

    unowned var consumer: Consumer

    init(consumer: Consumer) {
        self.consumer = consumer
    }

    deinit {
        print("Coke deleted")
    }

}

var consumer: Consumer? = Consumer()
    consumer!.coke = Coke(consumer: consumer!)
    consumer = nil

//: As seen above an instance of Consumer is referenced by the variable consumer, however the consumer property in Coke is an unowned reference to the Consumer instance, so when the variable consumer lets go of the instance, then the property consumer will also let go and the instance will subsequently be deleted from the memory.

class User {
    
    var computer: Computer!
    
    deinit {
        print("User deleted")
    }
    
}

class Computer {
    
    unowned var user: User
    
    init(user: User) {
        self.user = user
    }
    
    deinit {
        print("Computer deleted")
    }
    
}

var user: User! = User()
user.computer = Computer(user: user)

user
user.computer

user = nil

//: Two ways of avoiding the strong reference cycle works just fine, however the third way seen above allows you to access the connected instances without the need to unwrap as one of the properties are implicity unwrapped and may be set to nil to deinitialize both instances.



//: ## Breaking the strong reference cycle with closures


class Doer {
    
    let num: Int
    lazy var act: () -> Int = { [unowned self] in self.num }
    
    init(num: Int) {
        self.num = num
    }
    
    deinit {
        print("Doer deinitialized")
    }
    
}

var doer: Doer? = Doer(num: 10)
doer?.act

doer = nil

//: In the above case the closure act is lazy because it will not be in use until being accessed for the first time, which wouldn't occur before initialization. Thus, the use of self can still be used to refer to other properties.
//: When the act closure takes outside properties, a capture list is used to specify what kind of reference will be made to the class instance carrying those properties, which in this case will be an unowned reference to self. This way when deinitializing the class, the closure also lets go and both are freed from the memory.







 
























