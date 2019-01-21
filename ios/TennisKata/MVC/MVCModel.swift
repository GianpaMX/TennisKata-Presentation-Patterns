class MVCModel {
    public private(set) var player1score = Score.love
    public private(set) var player2score = Score.love

    private unowned let controller: MVCViewController

    init(player1score: Score = .love, player2score: Score = .love, controller: MVCViewController) {
        self.player1score = player1score
        self.player2score = player2score

        self.controller = controller
    }

    func player1() {
        if player1score == .winner || player2score == .winner {
            return
        }

        switch player1score {
        case .love:
            player1score = .fifteen
        case .fifteen:
            player1score = .thirty
        case .thirty:
            if player2score == .forty {
                player1score = .deuce
                player2score = .deuce
            } else {
                player1score = .forty
            }
        case .forty:
            if player2score == .advantage {
                player1score = .deuce
                player2score = .deuce
            } else {
                player1score = .winner
            }
        case .deuce:
            player1score = .advantage
            player2score = .forty
        case .advantage:
            player1score = .winner
        case .winner:
            break
        }
        controller.viewDidChange()
    }

    func player2() {
        if player1score == .winner || player2score == .winner {
            return
        }

        switch player2score {
        case .love:
            player2score = .fifteen
        case .fifteen:
            player2score = .thirty
        case .thirty:
            if player1score == .forty {
                player1score = .deuce
                player2score = .deuce
            } else {
                player2score = .forty
            }
        case .forty:
            if player1score == .advantage {
                player1score = .deuce
                player2score = .deuce
            } else {
                player2score = .winner
            }
        case .deuce:
            player1score = .forty
            player2score = .advantage
        case .advantage:
            player2score = .winner
        case .winner:
            break
        }
        controller.viewDidChange()
    }
}
