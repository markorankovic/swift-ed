extension String: Error {}

func sqrt(_ x: Int) throws -> Int {
    guard x >= 0 else {
        throw "Root of a negative number"
    }
    return Int(Double(x).squareRoot())
}

func sqrt(_ x: UInt) -> UInt {
    let x = Int(x)
    let result = try! sqrt(x)
    return UInt(result)
}

let uint = 3 as UInt

print(sqrt(uint))

