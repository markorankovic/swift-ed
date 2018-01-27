struct Board<Element> {
    
    let separator: String
    
    var rows: Int { return array.count }
    var cols: Int { return array.first?.count ?? 0 }
    
    private var array: [[Element]]
    
    init(cols: Int, rows: Int, element: Element, separator: String = " ") {
        self.separator = separator
        self.array = Array(
            repeating: Array(repeating: element, count: cols),
            count: rows
        )
    }
}

extension Board {
    
    subscript(row: Int, col: Int) -> Element {
        get {
            return array[row][col]
        }
        set {
            array[row][col] = newValue
        }
    }
    
    func paste(over other: Board, at row: Int, _ col: Int) -> Board {
        guard row < other.rows && col < other.cols else {
            return other
        }
        var other = other
        for r in row ..< min(row + rows, other.rows) {
            for c in col ..< min(col + cols, other.cols) {
                other[r, c] = self[r - row, c - col]
            }
        }
        return other
    }
}

extension Board: CustomStringConvertible {
    
    var description: String {
        return array.map{ $0.map{ "\($0)" }.joined(separator: separator) }.joined(separator: "\n")
    }
    
}

let board = Board(cols: 6, rows: 10, element: Character("•"))
let board2 = Board(cols: 4, rows: 2, element: Character("?"))
let board3 = board2.paste(over: board, at: 3, 3)
print(board3)




















