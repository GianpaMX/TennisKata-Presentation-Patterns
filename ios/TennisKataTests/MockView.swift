@testable import TennisKata

class MockView: View {
    private var wasCalled = false

    func wasScoreDidChangeCalled() -> Bool {
        return wasCalled
    }

    func scoreDidChange(_ player1score: String, _ player2score: String) {
        wasCalled = true
    }
}
