

import Foundation

//final class Car {
    
//}


//: error: ed.playground:1:7: error: inheritance from a final class 'Car'
//class BMW: Car {}


class Car {
    var model: Int
    init(model: Int) {
        self.model = model
    }
}

class BMW: Car {
    init() {
        super.init(model: 2018)
    }
}

let bmw = BMW()
bmw.model



