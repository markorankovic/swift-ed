
extension Collection where IndexDistance == Int {
    
    public func map2<R>(_ transformation: (Element) -> R) -> [R] {
        var newArr: [R] = []
        newArr.reserveCapacity(count)
        for e in self {
            newArr.append(transformation(e))
        }
        return newArr
    }
    
    public func filter2(reserveCapacity: Bool = true, _ predicate: (Element) -> Bool) -> [Element] {
        var newArr: [Element] = []
        if reserveCapacity { newArr.reserveCapacity(count) }
        for e in self where predicate(e) {
            newArr.append(e)
        }
        return newArr
    }
}

extension Int {
    var isEven: Bool { return self % 2 == 0 }
}

print(
    (1...9).filter2{ $0.isEven }
)

print(
    (1...9).map2{ $0.isEven }
)

print("✅")
