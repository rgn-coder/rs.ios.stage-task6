import Foundation

protocol CardBaseCompatible: Hashable, Codable {
    var suit: Suit {get}
    var value: Value {get}
    var isTrump: Bool {get}
    
    func hash(into hasher: inout Hasher)
}

enum Suit: Int, CaseIterable, Codable {
    case clubs
    case spades
    case hearts
    case diamonds
}

enum Value: Int, Codable, CaseIterable {
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
}

struct Card: CardBaseCompatible {
    let suit: Suit
    let value: Value
    var isTrump: Bool = false
    
    func hash(into hasher: inout Hasher) {
        
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        if lhs.suit == rhs.suit && lhs.value == rhs.value {//lhs == rhs {
            return true
        }
        return false
    }
}

extension Card {
    
    func checkIfCanBeat(card: Card) -> Bool {
        //принимает карту с руки игрока который отбивается проверяет ее среди карт другого игрока и возвращает бул
        //        if self
        if self.isTrump == false && card.isTrump == false && self.suit != card.suit {
            return false
        }
        if self.isTrump != card.isTrump && self.isTrump == true {
            return true
        }
        if self.isTrump != card.isTrump && card.isTrump == true {
            return false
        }
        if self.isTrump == false && card.isTrump == false {
            if card.value.rawValue > self.value.rawValue {
                return false
            }
        }
        if self.isTrump == false && card.isTrump == false {
            if card.value.rawValue < self.value.rawValue {
                return true
            }
        }
        if self.isTrump == true && card.isTrump == true {
                if card.value.rawValue < self.value.rawValue {
                    return true
                } else {
                    return false
                }
            }
            
            
            
            return false
        }
        
        func checkValue(card: Card) -> Bool {
            return false
        }
    }
