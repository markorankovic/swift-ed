


func printPrintableStuff<T: CustomStringConvertible>(_ element: T) {
    print(element)
}

enum TrafficLight: CustomStringConvertible {
    
    case red
    case yellow
    case green
    
    func equals(light: TrafficLight) -> Bool {
        return self == light
    }
    
    var description: String {
        switch self {
        case .red:
            return "red"
        case .yellow:
            return "yellow"
        case .green:
            return "green"
        }
    }
    
}


printPrintableStuff("This is working")

printPrintableStuff(TrafficLight.red)

TrafficLight.red.equals(light: .red)



var dict: [Int : String] = [:]

dict.capacity

    dict[1] = "One"
    dict[2] = "Two"
    dict[3] = "Three"
    dict[4] = "Four"
    dict[5] = "Five"
    dict[6] = "Six"
    dict[7] = "Seven"

dict.capacity

dict[1]

dict[1]?.hashValue






