

infix operator /+/
infix operator |+|

extension Array where Element == [Int] {
    
    func peek(_ description: String = "=") -> Array {
        print("\(description):")
        for row in self {
            print("\t", row.map{ "\($0)" }.joined(separator: " "))
        }
        print()
        return self
    }
    
    static func /+/(lhs: [Element], rhs: [Element]) -> [Element] {
        var arr: [Element] = []
        arr.reserveCapacity(lhs.count + rhs.count)
        for e in lhs {
            arr.append(e)
        }
        for e in rhs {
            arr.append(e)
        }
        return arr
    }
    
    static func |+|(lhs: [Element], rhs: [Element]) -> [Element] {
        var arr: [Element] = []
        arr.reserveCapacity(lhs.count + rhs.count)
        for i in 0..<lhs.count {
            arr.append(lhs[i])
            if i < rhs.count {
                arr.append(rhs[i])
            }
        }
        if rhs.count > lhs.count {
            for i in lhs.count..<rhs.count {
                arr.append(rhs[i])
            }
        }
        return arr
    }
    
}

let block1 = [[1, 1], [2, 2]].peek("block1")
let block2 = [[2, 2], [1, 1]].peek("block2")

[[1, 1, 2, 2], [2, 2, 1, 1]].peek("block1 |+| block2")
[[1, 1], [2, 2], [2, 2], [1, 1]].peek("block1 /+/ block2")

([[1, 1], [2, 2]] /+/ [[1, 1], [2, 2]]).peek()
([[1, 1], [2, 2]] |+| [[1, 1], [2, 2]]).peek() 


let bin: UInt8 = ~0b11111010

let bin2: UInt8 = 0b1010 << 3

let bin3: UInt8 = 0b1000_0001





