

var someNum = 10

func changeANum(currentNum: inout Int, newNum: Int) {
    currentNum = newNum
}

changeANum(currentNum: &someNum, newNum: 15)

someNum
