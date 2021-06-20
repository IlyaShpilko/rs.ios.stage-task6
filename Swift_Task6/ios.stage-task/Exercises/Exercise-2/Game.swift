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
        
        guard var low = players.first?.hand?.first else { return nil }
        var playerStarting = players.first
        
        
        for player in players {
            
            guard let hands = player.hand else { return nil }
            
            for card in hands {
                if card.isTrump == true && low.checkValue(card: card) {
                    low = card
                    playerStarting = player
                }
                
                if card.isTrump == true && low.isTrump == false {
                    low = card
                    playerStarting = player
                }
            }
        }
        
        return playerStarting
    }
}
