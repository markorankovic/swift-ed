

struct Graph {
    
    private let a: Double
    private let b: Double
    
    init(a: Double, b: Double) {
        self.a = a
        self.b = b
    }
    
    //: Calculate y given x
    subscript(x: Double) -> Double {
        return a * x + b
    }
    
}

let g = Graph(a: 1, b: 10)

g[10]
