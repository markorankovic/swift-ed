

//: # Memory Safety

var num: Int = 10 {
    willSet {
        num = 30
    }
}

num = 20

var doubleNum: Int {
    return num * 2
}

doubleNum

/*:
    Before starting examples in this chapter I tried running an experiment, which was to see what would happen if I tried setting a variable with another value while already on the process of being set. What happened here is that I set num to 30 before num was set to 20. As a result after being set to 30, num was subsequently set to 20. This means that I didn't really end up interfering with the process after all. Therefore, I now have a curiosity to satisfy by proceeding with examples where this process actually is being interfered with in this chapter.
*/




