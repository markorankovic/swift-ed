

enum TrafficLights: Int {
    case Red = 1, Yellow, Green
}

var trafficLight: TrafficLights = .Red

trafficLight = .Green


if let light = TrafficLights(rawValue: 2) {
    switch light {
        case .Red: print(1)
        case .Yellow: print(2)
        case .Green: print(3)
    }
} else {
    print("Value does not exist")
}


