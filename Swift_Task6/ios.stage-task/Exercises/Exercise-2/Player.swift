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
        guard let newHand = hand else { return false }
        
        for index in newHand {
            if index.value == card.value {
                return true
            }
        }
        return false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        guard let newHand = hand else { return false }
        
        for i in newHand {
            for j in table {
                if i.value == j.value.value {
                    return true
                }
                
                if i.value == j.key.value {
                    return true
                }
            }
        }
        return false
    }
}
