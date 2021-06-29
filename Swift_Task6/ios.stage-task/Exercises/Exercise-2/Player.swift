//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}


final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        if let arrayWithPlayersCards = self.hand,
           arrayWithPlayersCards.isEmpty == false {
            for cardForAttacking in arrayWithPlayersCards {
                if cardForAttacking.value == card.value || cardForAttacking.isTrump == true {
                    return true
                }
                
            }
        }
        
            
        
        
        return false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        if let arrayWithPlayersCards = self.hand,
           arrayWithPlayersCards.isEmpty == false {
            for cardForAttacking in arrayWithPlayersCards {
                for key in table.keys {
                    if key.value == cardForAttacking.value {
                        return true
                    }
                }
                for val in table.values {
                    if val.value == cardForAttacking.value {
                        return true
                    }
                }
            }
        }
        return false
    }
}
extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        if lhs.hand == rhs.hand {
            return true
        }
        return false
    }
    
    
}
