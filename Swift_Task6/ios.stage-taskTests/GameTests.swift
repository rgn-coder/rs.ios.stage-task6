//
//  GameTests.swift
//  ios.stage-task
//
//  Created by Regisha on 27.06.2021.
//


import XCTest
@testable import ios_stage_task

final class GameTests: XCTestCase {
    var game: Game!
    let player1: Player = Player()
    let player2: Player = Player()
    
    override func setUp() {
        
        super.setUp()
        self.game = Game(players: [self.player1, self.player2])
    }
   public func testDefineFirstAttackingPlayer() throws {
    let minimumTrump = Card(suit: Suit.diamonds, value: Value.eight, isTrump: true)
    var p1 = Player()
    let p1Hand = [
        Card(suit: Suit.diamonds, value: Value.ace, isTrump: true),
        Card(suit: Suit.clubs, value: Value.ace, isTrump: false),
        Card(suit: Suit.hearts, value: Value.ace, isTrump: false)
    ]
    p1.hand = p1Hand
    var p2 = Player()
    let p2Hand = [
        minimumTrump,
        Card(suit: Suit.clubs, value: Value.jack, isTrump: false),
        Card(suit: Suit.hearts, value: Value.eight, isTrump: false)
    ]
    p2.hand = p2Hand
    let game = Game(players: [p1, p2])
    var firstAttackingPlayer = game.defineFirstAttackingPlayer(players: [p1, p2])
    XCTAssertEqual(firstAttackingPlayer, p2)
    XCTAssertNotEqual(firstAttackingPlayer, p1)
   }
    
}
