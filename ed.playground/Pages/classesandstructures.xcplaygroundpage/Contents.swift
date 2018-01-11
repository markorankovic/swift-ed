


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


struct Card: Hashable {
    
    let suit: Suit
    let rank: Rank
    
    let hashValue: Int
    
    init(_ rank: Rank, of suit: Suit) {
        (self.rank, self.suit) = (rank, suit)
        hashValue = rank.hashValue ^ suit.hashValue
    }
}

extension Card {
    
    enum Suit: String {
        case hearts = "♥︎"
        case diamonds = "♦︎"
        case clovers = "♣︎"
        case spades = "♠︎"
    }
    
    enum Rank: Int {
        case ace = 1, two, three, four, five, six, seven, eight, nine, ten
        case jack = 12, queen, king
    }
}

// MARK:- Conformances

extension Card: Equatable {
    
    public static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.rank == rhs.rank
            && lhs.suit == rhs.suit
    }
}

extension Card: CustomStringConvertible {
    
    var description: String {
        return "\(rank)\(suit)"
    }
}

extension Card.Suit: Equatable {
    
    public static func == (lhs: Card.Suit, rhs: Card.Suit) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

extension Card.Suit: CustomStringConvertible {
    
    var description: String {
        return "\(rawValue)"
    }
}

extension Card.Rank: CustomStringConvertible {
    
    var description: String {
        switch self {
        case .ace: return "A"
        case .queen: return "Q"
        case .king: return "K"
        default: return "\(rawValue)"
        }
    }
}

// MARK:- Random

import Darwin

protocol Random {
    static var random: Self { get }
}

extension Card {
    
    static var random: Card {
        return .init(.random, of: .random)
    }
}

extension Card.Suit: Random {
    
    static let all: [Card.Suit] = [.hearts, .diamonds, .clovers, .spades]
    
    static var random: Card.Suit {
        return all[Int(arc4random_uniform(UInt32(all.count)))]
    }
}

extension Card.Rank: Random {
    
    static let all: [Card.Rank] = [
        .ace, .two, .three, .four, .five, .six, .seven,
        .eight, .nine, .ten, .jack, .queen, .king
    ]
    
    static var random: Card.Rank {
        return all[Int(arc4random_uniform(UInt32(all.count)))]
    }
}

// MARK:- Examples

print((1...10).map{ _ in Card.random })

