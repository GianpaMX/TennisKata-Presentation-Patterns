import XCTest
@testable import TennisKata

class ModelTests: XCTestCase {

    func testZeros() {
        let model: Model = Model()

        XCTAssertEqual(model.player1score, .love)
        XCTAssertEqual(model.player2score, .love)
    }

    func testFifteen() {
        let model: Model = Model()

        let result = model.player1()

        XCTAssertEqual(result.0, .fifteen)
    }

    func testThirty() {
        let model: Model = Model(player1score: .fifteen)

        let result = model.player1()

        XCTAssertEqual(result.0, .thirty)
    }

    func testForthy() {
        let model: Model = Model(player1score: .thirty)

        let result = model.player1()

        XCTAssertEqual(result.0, .forty)
    }

    func testSimpleWinner() {
        let model: Model = Model(player1score: .forty, player2score: .thirty)

        let result = model.player1()

        XCTAssertEqual(result.0, .winner)
    }

    func testDeuce() {
        let model: Model = Model(player1score: .forty, player2score: .thirty)

        let result = model.player2()

        XCTAssertEqual(result.0, .deuce)
        XCTAssertEqual(result.1, .deuce)
    }


    func testAdvantage() {
        let model: Model = Model(player1score: .deuce, player2score: .deuce)

        let result = model.player2()

        XCTAssertEqual(result.0, .forty)
        XCTAssertEqual(result.1, .advantage)
    }

    func testGoBackToDeuce() {
        let model: Model = Model(player1score: .advantage, player2score: .forty)

        let result = model.player2()

        XCTAssertEqual(result.0, .deuce)
        XCTAssertEqual(result.1, .deuce)
    }

    func testWinnerFromAdvantage() {
        let model: Model = Model(player1score: .advantage, player2score: .forty)

        let result = model.player1()

        XCTAssertEqual(result.0, .winner)
    }


    func testLockScore() {
        let model: Model = Model(player1score: .winner, player2score: .forty)

        _ = model.player1()
        let result = model.player2()

        XCTAssertEqual(result.0, .winner)
        XCTAssertEqual(result.1, .forty)
    }
}
