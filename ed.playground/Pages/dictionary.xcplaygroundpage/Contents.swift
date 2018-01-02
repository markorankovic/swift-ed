struct Dict<Key: Hashable, Value> {
    
    fileprivate var storage: Set<Pair<Key, Value>>
    
    subscript(key: Key) -> Value? {
        get {
            guard let firstValue = storage.first?.value else {
                return nil
            }
            let x = Pair(key: key, value: firstValue)
            return storage.index(of: x).map{ storage[$0] }?.value
        }
        set {
            guard let firstValue = storage.first?.value else {
                return
            }
            let x = Pair(key: key, value: firstValue)
            storage.remove(x)
            guard let newValue = newValue else {
                return
            }
            storage.insert(Pair(key: key, value: newValue))
        }
    }
}

struct Pair<Key: Hashable, Value>: Hashable {
    let key: Key
    var value: Value!
    var hashValue: Int { return key.hashValue }
    var pair: (Key, Value) { return (key, value) }
}

extension Pair: Equatable {
    public static func == (lhs: Pair, rhs: Pair) -> Bool {
        return lhs.key == rhs.key
    }
}

extension Dict: Sequence {
    func makeIterator() -> Array<(Key, Value)>.Iterator {
        return storage.map{ ($0.key, $0.value) }.makeIterator()
    }
}

extension Dict: MutableCollection {
    typealias Index = Set<Pair<Key, Value>>.Index
    
    var startIndex: Index { return storage.startIndex }
    
    var endIndex: Index { return storage.endIndex }
    
    subscript(index: Index) -> (Key, Value) {
        get {
            return storage[index].pair
        }
        set {
            storage.insert(Pair(key: newValue.0, value: newValue.1))
        }
    }
    
    func index(after index: Index) -> Index {
        return storage.index(after: index)
    }
}

extension Dict: ExpressibleByDictionaryLiteral {
    init(dictionaryLiteral elements: (Key, Value)...) {
        storage = Set(elements.map{ Pair(key: $0.0, value: $0.1) })
    }
}

var d: Dict = [
    1: "a",
    2: "b",
    3: "c"
]

for (key, value) in d {
    print(key, value)
}

d[2]
d[2] = "B"
d[2]

print("✅")
