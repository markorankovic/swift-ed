

var someNum = 10

func changeANum(currentNum: inout Int, newNum: Int) {
    currentNum = newNum
}

changeANum(currentNum: &someNum, newNum: 15)

someNum



func swap2(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var (a, b) = (1, 2)

swap2(&a, &b)

print(a, b) // → 2 1
