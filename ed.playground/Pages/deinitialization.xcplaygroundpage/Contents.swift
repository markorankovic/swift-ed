



class A {
    
    init() {
        print("Instance initialized")
    }
    
    deinit {
        print("Instance deinitialized")
    }
    
}

var a: A? = A()

a = nil


