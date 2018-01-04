

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
    (a: Int) -> Int in return a * 2
}

// Or

numbers.map2 { $0 * 2 }



