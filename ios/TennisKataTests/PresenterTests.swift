import XCTest
@testable import TennisKata

class PresenterTests: XCTestCase {
    let mockView = MockView()

    let presenter: Presenter = Presenter(model: Model())

    override func setUp() {
        presenter.view = mockView
    }

    func testPlayer1() {
        presenter.player1()

        XCTAssertTrue(mockView.wasScoreDidChangeCalled())
    }
    func testPlayer2() {
        presenter.player2()

        XCTAssertTrue(mockView.wasScoreDidChangeCalled())
    }
}
