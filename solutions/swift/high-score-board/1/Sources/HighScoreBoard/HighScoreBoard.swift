func newScoreBoard() -> [String: Int] {
  var scoreBoard: [String: Int] = [:]
  return scoreBoard
}

func addPlayer(_ scores: inout [String: Int], _ name: String, _ score: Int = 0) {
  scores[name] = score
}

func removePlayer(_ scores: inout [String: Int], _ name: String) {
  scores[name] = nil
}

func resetScore(_ scores: inout [String: Int], _ name: String) {
  guard let _ = scores[name] else { return }
  scores[name] = 0
}

func updateScore(_ scores: inout [String: Int], _ name: String, _ delta: Int) {
  guard let score = scores[name] else { return }
  scores[name] = score + delta
}

func orderByPlayers(_ scores: [String: Int]) -> [(String, Int)] {
 scores.sorted(by: <)
}

func orderByScores(_ scores: [String: Int]) -> [(String, Int)] {
  scores.sorted(by: { $0.value > $1.value } )
}
