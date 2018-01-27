


do {

    let num: Int? = 1
    print(num!)

}

do {
    
    let num: Int! = 1
    print(num)
    
}

do {
    
    let num: Int = 1
    print(num)
    
}

do {
    
    let num1: Int! = 1
    let num2: Int = 1
    num1 == num2
    
}

do {
    
    func printNumIfAny(num: Int!) {
        print(num)
    }
    
    let theNum: Int? = 8
    printNumIfAny(num: theNum)
    
}

