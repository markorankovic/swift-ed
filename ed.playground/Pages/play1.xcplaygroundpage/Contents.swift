

enum Thing: String {
    case solid
    case liquid
    case gas
}

class Board<T>: CustomStringConvertible {
    
    var rows = 0, cols: Int = 0
    var arr: [[T]]
    
    init(cols: Int, rows: Int, fillValue: T) {
        self.cols = cols
        self.rows = rows
        self.arr = Array(repeating: Array(repeating: fillValue, count: cols), count: rows)
    }
    
    var description: String {
        var result = ""
        for i in 0..<arr.count {
            result.append(arr[i].map{ "\($0)" }.joined(separator: " "))
            result.append("\n")
        }
        return result
    }
    
}

let board = Board(cols: 10, rows: 10, fillValue: Thing.solid)

print(board)

class CharBoard: Board<Character> {
    
}

let charBoard = CharBoard(cols: 10, rows: 10, fillValue: Character("X"))

print(charBoard)


