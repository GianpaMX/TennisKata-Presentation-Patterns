import XCTest
@testable import TennisKata

class ViewModelTests: XCTestCase {
    var hasViewStateChange = false
    let viewModel: ViewModel = ViewModel(model: Model())
    
    override func setUp() {
        viewModel.observer = { [weak self] viewState in
            self?.hasViewStateChange = true
        }
    }

    func testPlayer1() {
        viewModel.player1()
        
        XCTAssertTrue(hasViewStateChange)
    }
    
    func testPlayer2() {
        viewModel.player2()
        
        XCTAssertTrue(hasViewStateChange)
    }
}
