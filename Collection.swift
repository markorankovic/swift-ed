

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