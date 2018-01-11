


indirect enum Expr {
    
    case number(Double)
    case addition(Expr, Expr)
    case multiplication(Expr, Expr)
    
    var evaluated: Double { get { return evaluate(self) } }
    
    func evaluate(_ expr: Expr) -> Double {
        switch self {
            case .number(let num): return num
            case .addition(let lhs, let rhs): return lhs.evaluated + rhs.evaluated
            case .multiplication(let lhs, let rhs): return lhs.evaluated * rhs.evaluated
        }
    }
    
}

func +(lhs: Double, rhs: Double) -> Expr {
    return .addition(.number(lhs), .number(rhs))
}

func *(lhs: Double, rhs: Double) -> Expr {
    return .multiplication(.number(lhs), .number(rhs))
}



let expr: Expr = ((10 + 5) * 3) + 5
expr.evaluated


