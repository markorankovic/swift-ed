

import Foundation

let numbers = Array(stride(from: 0, to: 10, by: 0.1).map{ _ in arc4random_uniform(10) })


extension Array {
    
    func getWindow(index: Int, by: Int) -> [Element] {
        
        var window: [Element] = []
        
        var lowerBound: Int = index < index + by ? index + 1 : index + by
        
        if lowerBound >= self.count { return window }
        
        var upperBound: Int = index > index + by ? index - 1 : index + by
        
        lowerBound = lowerBound < 0 ? 0 : lowerBound
        upperBound = upperBound >= self.count ? self.count - 1 : upperBound
        
        for i in lowerBound...upperBound {
            window.append(self[i])
        }
        
        return window
        
    }
    
}

extension Array where Element: FixedWidthInteger {

    func avgAroundElement(element: Element, index: Int, radius: Int) -> Element {
        let leftWindow: [Element] = getWindow(index: index, by: -radius)
        let rightWindow: [Element] = getWindow(index: index, by: radius)
        let total = leftWindow.reduce(0){ $0 + $1 } + element + rightWindow.reduce(0){ $0 + $1 }
        return total / Element(leftWindow.count + rightWindow.count + 1)
    }

}

// Below carries out the smoothing process for the points

let radius = 5
var index = 0
numbers.map { (e: UInt32) -> UInt32 in
    index += 1
    return numbers.avgAroundElement(element: e, index: index, radius: 5)
}



