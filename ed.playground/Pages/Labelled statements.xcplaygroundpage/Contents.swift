

outer: for x in 1...5 {
    print(x, terminator: ": ")
    inner: for y in 1...5 {
        print(y, terminator: " ")
        if (x, y) == (3, 3) {
            break outer
        }
    }
    print()
}

print("✅")
