


struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

print("The width of someResolution is \(someResolution.width)")
// Prints "The width of someResolution is 0"

print("The width of someVideoMode is \(someVideoMode.resolution.width)")
// Prints "The width of someVideoMode is 0"

let vga = Resolution(width: 640, height: 480)

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048

print("hd is still \(hd.width) pixels wide")
// Prints "hd is still 1920 pixels wide"


enum CompassPoint {
    case north, south, east, west
}
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection = .east
if rememberedDirection == .west {
    print("The remembered direction is still .west")
}
// Prints "The remembered direction is still .west"


let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// Prints "The frameRate property of tenEighty is now 30.0"

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// Prints "tenEighty and alsoTenEighty refer to the same VideoMode instance."


enum Color: String {
    case Black = "Black"
    case White = "White"
    case Yellow = "Yellow"
    case Red = "Red"
    case Orange = "Orange"
    case Blue = "Blue"
    case Green = "Green"
    case Grey = "Grey"
}

struct Hoodie {
    let size: String
    let brand: String
    let price: Double
    let color: Color
}


struct Card {
    let suit: Suit
    let faceValue: FaceValue
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.suit.rawValue == rhs.suit.rawValue && lhs.faceValue.rawValue == rhs.faceValue.rawValue
    }
    static func <(lhs: Card, rhs: Card) -> Bool {
        return lhs.faceValue.rawValue < rhs.faceValue.rawValue
    }
    static func >(lhs: Card, rhs: Card) -> Bool {
        return lhs.faceValue.rawValue > rhs.faceValue.rawValue
    }
}

enum Suit: String {
    case Hearts = "Hearts"
    case Diamonds = "Diamonds"
    case Clovers = "Clovers"
    case Spades = "Spades"
}

enum FaceValue: Int {
    case One = 1
    case Two = 2
    case Three = 3
    case Four = 4
    case Five = 5
    case Six = 6
    case Seven = 7
    case Eight = 8
    case Nine = 9
    case Ten = 10
    case Ace = 11
    case Jack = 12
    case Queen = 13
    case King = 14
}

let cardA = Card(suit: .Spades, faceValue: .King)
let cardB = Card(suit: .Diamonds, faceValue: .Ace)
cardA == cardB
cardA > cardB

