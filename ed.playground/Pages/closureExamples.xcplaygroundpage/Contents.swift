

func goLeft() {
    print("Goes left..")
}

func goRight() {
    print("Goes right..")
}

func goSomewhere(_ go: () -> ()) {
    go()
}

goSomewhere(goLeft)


func binaryOperate<T>(_ a: T, _ b: T, _ operate: (T, T) -> T) -> T {
    return operate(a, b);
}

binaryOperate(4, 5, +)



let numbers = [1, 2, 3, 4, 5, 6]

extension Sequence {
    func map2(operation: (Element) -> Element) -> [Element] {
        var res: [Element] = []
        for e in self {
            res.append(operation(e))
        }
        return res
    }
}

numbers.map2 {
    (a: Int) -> Int in a * 2
}

// Or

numbers.map2 { $0 * 2 }




struct A {
    func method(_ value: Int) -> Int { return value * value }
}

struct B {
    let property: (Int) -> Int = { value in value * value }
}

do {
    let (a, b) = (A(), B())
    
    a.method(5)
    b.property(5)
    
    let fa = a.method
    fa(5)
    
    let fb = b.property
    fb(5)
}
do {
    let a = A()
    let fA = A.method
    let fa = fA(a)
    fa(5)
}
do {
    let b = B()
    let fB = \B.property
    let fb = b[keyPath: fB]
    fb(5)
}



var listOfClosures: [() -> Int] = []

func addClosure(_ clo: @escaping () -> Int) {
    listOfClosures.append(clo)
}

addClosure({ print("Working!"); return 1 })

listOfClosures[0]()





