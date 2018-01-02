
do {
    let r = 1...5
    r ~= 5

    switch 5 {
    case 1...5: "it's in 1...5 range"
    default: "no idea what range it is in :("
    }
}

struct MyRange {
    let start: Int
    let end: Int
    init(start: Int, end: Int) {
        precondition(start <= end)
        self.start = start
        self.end = end
    }
}

func ... (start: Int, end: Int) -> MyRange {
    return .init(start: start, end: end)
}

func ~= (range: MyRange, value: Int) -> Bool {
    return value >= range.start && value <= range.end
}

extension MyRange: CustomStringConvertible {
    var description: String {
        return "MyRange(start: \(start), end: \(end))"
    }
}

do {
    let r: MyRange = 1...5
    r ~= 5
    
    switch 5 {
    case 1...5: "it's in 1...5 range"
    default: "no idea what range it is in :("
    }
}

