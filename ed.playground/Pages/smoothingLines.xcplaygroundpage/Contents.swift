import Darwin

extension Int {
    func clamped(to range: CountableRange<Int>) -> Int {
        return Swift.min(range.upperBound - 1, Swift.max(range.lowerBound, self))
    }
}

extension Collection where Indices == CountableRange<Int> {
    
    func elements(before index: Int, maxCount: Int) -> [Element] {
        return elements(after: index, maxCount: -maxCount)
    }

    func elements(after index: Int, maxCount: Int) -> [Element] {
        let lowerBound = (maxCount > 0 ? index + 1 : index + maxCount).clamped(to: indices)
        let upperBound = (maxCount < 0 ? index - 1 : index + maxCount).clamped(to: indices)
        return lowerBound < upperBound ? Array(self[lowerBound ... upperBound]) : []
    }
}

extension Collection where Indices == CountableRange<Int>, Element: FloatingPoint {

    func averageAround(index: Int, radius: Int) -> Element {
        let leftWindow = elements(before: index, maxCount: radius)
        let rightWindow = elements(after: index, maxCount: radius)
        let total = leftWindow.reduce(0, +) + self[index] + rightWindow.reduce(0, +)
        return total / Element(leftWindow.count + rightWindow.count + 1)
    }
}

var a = Array(stride(from: 0, to: 10, by: 0.05).map{ _ in Double(arc4random_uniform(10)) })

a = a.indices.map { i in a.averageAround(index: i, radius: 5) }
a = a.indices.map { i in a.averageAround(index: i, radius: 5) }
a = a.indices.map { i in a.averageAround(index: i, radius: 5) }
a = a.indices.map { i in a.averageAround(index: i, radius: 5) }
a = a.indices.map { i in a.averageAround(index: i, radius: 5) }
a = a.indices.map { i in a.averageAround(index: i, radius: 5) }








