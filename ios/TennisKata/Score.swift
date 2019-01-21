enum Score: String {
    case love
    case fifteen
    case thirty
    case forty
    
    case deuce
    case advantage
    
    case winner
}

typealias ScoreResult = (Score, Score)
