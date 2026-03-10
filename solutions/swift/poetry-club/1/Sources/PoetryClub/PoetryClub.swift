import Foundation

func splitOnNewlines(_ poem: String) -> [String] {
  return poem.components(separatedBy: "\n")
}

func frontDoorPassword(_ phrase: String) -> String {
  let individualLines = phrase.components(separatedBy: "\n")
  var ans: [String] = []

  individualLines.map { $0.isEmpty ? ans.append("_") : ans.append(String($0.first ?? "_")) }

  return ans.joined(separator: "")
}

func backDoorPassword(_ phrase: String) -> String {
  let individualLines = phrase.components(separatedBy: "\n")
  var ans: [String] = []

  let trimmedLines = individualLines.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
  trimmedLines.map { $0.isEmpty ? ans.append("_") : ans.append(String($0.last ?? "_")) }

  return "\(ans.joined()), please"
}

func secretRoomPassword(_ phrase: String) -> String {
  let individualLines = phrase.components(separatedBy: "\n")
  var ans: [String] = []

  for (i, individualLine) in individualLines.enumerated() {
    let chars = Array(individualLine)  // convert to Array for easier indexing
    let indexExistsInLine = i < chars.count
    
    indexExistsInLine ? ans.append(String(chars[i])) : ans.append("_")
  }

  return ans.joined().uppercased() + "!"
}