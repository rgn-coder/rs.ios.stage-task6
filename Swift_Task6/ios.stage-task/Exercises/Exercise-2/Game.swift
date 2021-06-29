//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {
    
    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        var minTrump:Value? = nil
        var duringPlayer:Player? = nil
        for player in players {
            guard let playersHand = player.hand else {
                continue
            }
            for card in playersHand {
               
                if card.isTrump == true {
                    if let minimumTrump = minTrump {
                        if minimumTrump.rawValue > card.value.rawValue {
                            minTrump = card.value
                            duringPlayer = player
                        }
                    } else {
                        minTrump = card.value
                        duringPlayer = player
                    }
                    
                }
            }
           
        }
        return duringPlayer
    }
    
    
}

