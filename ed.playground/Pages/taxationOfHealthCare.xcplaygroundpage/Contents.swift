


//: # US Healthcare
//: Single VS Multipayer system
/*:
 The goal of this program is to make a comparison between the money spent throughout a person's lifetime with and without taxes
*/

// Currency is in USD


enum Surgery {
        
    case chemoTherapy
    case spineSurgery
    case hipReplacement
    case tumorRemoval(Person.Organ)
    case transplant(Person.Organ)
    case general
    
    static func chooseSurgery(condition: Person.MedicalCondition) -> Surgery {
        
        switch condition {
            
            case let .organCondition(organ, degree):
                if degree.rawValue > 2 {
                    return .transplant(organ)
                } else {
                    return .general
                }
            
            case let .injury(bodyPart, degree): return (degree.rawValue > 2 && bodyPart == .back ? .spineSurgery : .general)
            
            case let .cancer(organ, degree): return degree.rawValue > 3 ? .tumorRemoval(organ) : .chemoTherapy
            
            default: return .general
            
        }
        
    }
    
    static func estimatePriceForSurgery(of condition: Person.MedicalCondition) -> Int {
        
        switch condition {
            case .stroke: return 20000
            case .heartAttack: return 53000
            default: break
        }
        
        let surgery = chooseSurgery(condition: condition)
        
        switch surgery {
            case .chemoTherapy: return 30000
            case .spineSurgery: return 169000
            case .hipReplacement: 39299
            
            case let .tumorRemoval(organ):
                switch organ {
                    case .brain: return 600000
                    default: return 140000
                }
            
            case let .transplant(organ):
                switch organ {
                    case .heart: return 787200
                    case .liver: return 577100
                    default: return 600000
                }
            case .general: return 150
        }
        
        return 15000
        
    }
        
}
    
    

struct Person {
    
    enum Organ {
        
        case brain
        case heart
        case lungs
        case liver
        case stomach
        case skin
        case bone
        case bowel
        case pancreas
        
    }
    
    enum BodyPart {
        
        case head
        case arm
        case torso
        case back
        case leg
        
    }
    
    enum MedicalCondition {
        
        enum Degree: Int {
            case one = 1
            case two = 2
            case three = 3
            case four = 4
            case five = 5
        }
        
        case cancer(Organ, Degree)
        case organCondition(Organ, Degree)
        case injury(BodyPart, Degree)
        case flu(Degree)
        case commonCold(Degree)
        case stroke
        case heartAttack
        case general
        
    }
    
    let name: String
    let income: Int
    let healthcareTax: Double
    let yearsOfWork: Int
    var historyOfMedicalConditions: [MedicalCondition]
    
    var totalPriceForAllTreatment: Int {
        var total: Int = 0
        for condition in historyOfMedicalConditions {
            total += Surgery.estimatePriceForSurgery(of: condition)
        }
        return total
    }
    
    var totalMoneyPaidFromTaxes: Int {
        return Int(Double(yearsOfWork * income) * healthcareTax)
    }
    
}



let john = Person(name: "John",
                  income: 81000,
                  healthcareTax: 0.2,
                  yearsOfWork: 50,
                           historyOfMedicalConditions: [.heartAttack,
                                                        .stroke,
                                                        .cancer(.lungs, .four),
                                                        .injury(.back, .five),
                                                        .flu(.three),
                                                        .general])
john.totalPriceForAllTreatment
john.totalMoneyPaidFromTaxes















