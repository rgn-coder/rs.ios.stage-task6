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
        var cards = [Card]()
        
        
        for suit in suits {
            for value in values {
                
                cards.append(Card(suit: suit, value: value))
                
                
                print(cards)
            }
            
        }
        return cards
    }
    
    public mutating func shuffle() {
        cards.shuffle()
        
    }
    
    public mutating func defineTrump() {
        
        self.trump = cards.first?.suit
        guard let trump = self.trump else {
            return
        }
        setTrumpCards(for: trump)
        
    }
    
    public mutating func initialCardsDealForPlayers(players: [Player]) {
        
        for player in players {
            var arrayWithPlayersCards: [Card] = []
            
            for _ in 0..<6 {
                guard let card = self.getTopCard() else {
                    continue
                }
                arrayWithPlayersCards.append(card)
                
            }
            player.hand = arrayWithPlayersCards
            
        }
        
    }
    
    public mutating func setTrumpCards(for suit:Suit) {
        
        
        for (index, card) in cards.enumerated() {
            if card.suit == trump {
                var changeTrumpInCard = card
                changeTrumpInCard.isTrump = true
                print(cards)
                cards[index] = changeTrumpInCard
                print(cards)
                
               
                
            }
        }
    }
    
    public mutating func getTopCard() -> Card? {
        let card = self.cards.first
        self.cards.removeFirst()
        return card
    }
}

