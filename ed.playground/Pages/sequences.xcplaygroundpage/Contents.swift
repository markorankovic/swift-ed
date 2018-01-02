extension Sequence {
    
    public func map2<R>(_ transformation: (Element) -> R) -> [R] {
        var newSeq: [R] = []
        for e in self {
            newSeq.append(transformation(e))
        }
        return newSeq
    }
    
    public func filter2(_ predicate: (Element) -> Bool) -> [Element] {
        var newSeq: [Element] = []
        for e in self where predicate(e) {
            newSeq.append(e)
        }
        return newSeq
    }
    
    public func reduce2<R>(_ accumulator: R, _ operation: (R, Element) -> R) -> R {
        var result = accumulator
        for e in self {
            result = operation(result, e)
        }
        return result
    }
}

print("sum of first 100 integers:", (1...100).reduce2(0, +))

print("✅")

