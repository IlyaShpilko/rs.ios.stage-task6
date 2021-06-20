import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
        cards = createDeck(suits: Suit.allCases, values: Value.allCases)
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        var newCards = [Card]()
        
        for i in suits {
            for j in values {
                newCards.append(Card(suit: i, value: j))
            }
        }
        
        return newCards
    }

    public mutating func shuffle() {
        cards.shuffle()
    }

    public mutating func defineTrump() {
        
        trump = cards.last?.suit
        
        guard let newTrump = trump else { return }
        
        setTrumpCards(for: newTrump)
        
    }

    public mutating func initialCardsDealForPlayers(players: [Player]) {
        
        var arrayCards = [Card]()
        
        players.forEach { hands in
            
            var index = 0
            
            while index < 6 {
                arrayCards.append(cards[0])
                cards.remove(at: 0)
                index += 1
            }
            
            hands.hand = arrayCards
        }
        
    }

    public mutating func setTrumpCards(for suit:Suit) {
        
        for (index, card) in cards.enumerated() {
            if card.suit == suit {
                cards[index].isTrump = true
            }
        }
    }
}

