


protocol PhysicallyAbled {
    
    func run()
    
    func walk()
    
    func listen()
    
    func talk()
    
}

class Person {
    
    let name: String
    let weight: Int
    let height: Int
    
    init(name: String, weight: Int, height: Int) {
        self.name = name
        self.weight = weight
        self.height = height
    }
    
}

class AbledPerson: Person, PhysicallyAbled {
    
    override init(name: String, weight: Int, height: Int) {
        super.init(name: name, weight: weight, height: height)
    }
    
    func run() {
        print("\(name) is running")
    }
    
    func walk() {
        print("\(name) is walking")
    }
    
    func listen() {
        print("\(name) is listening")
    }
    
    func talk() {
        print("\(name) is talking")
    }
    
}

let abledPerson = AbledPerson(name: "John Smith", weight: 80, height: 185)

abledPerson.run()
abledPerson.walk()
abledPerson.listen()
abledPerson.talk()




//: ## The charitable person
/*:
 In this section I create a class GoodIndividual which consists of an Individual who donates money to either another Individual or a Charity, the GoodIndividual also greets
 */


protocol ReceivesMoney {
    
    func receive(money: Double)
    
}

protocol WellBehaved {
    
    func donateMoney<E: ReceivesMoney>(to: E, amount: Double) -> Double
    
    func greet()
    
}

class Individual: ReceivesMoney {
    
    let name: String
    let occupation: String
    var balance: Double
    
    func receive(money: Double) {
        self.balance += money
    }
    
    init(name: String, occupation: String, balance: Double) {
        self.name = name
        self.occupation = occupation
        self.balance = balance
    }

}

class Charity: ReceivesMoney {
    
    var budget: Double
    
    func receive(money: Double) {
        budget += money
    }
    
    init(budget: Double) {
        self.budget = budget
    }
    
}


class GoodIndividual: Individual, WellBehaved {
    
    func donateMoney<E: ReceivesMoney>(to: E, amount: Double) -> Double {
        self.balance -= amount
        to.receive(money: amount)
        return amount
    }
    
    func greet() {
        print("Hey dude! How are you doing?")
    }
    
}

let unicef = Charity(budget: 50)
let poorMan = Individual(name: "James", occupation: "None", balance: 0)

let richMan = GoodIndividual(name: "Bill Gates", occupation: "Chairman of Microsoft", balance: 90)

unicef.budget
poorMan.balance

richMan.donateMoney(to: unicef, amount: 20)
richMan.donateMoney(to: poorMan, amount: 0.001)

unicef.budget
poorMan.balance



