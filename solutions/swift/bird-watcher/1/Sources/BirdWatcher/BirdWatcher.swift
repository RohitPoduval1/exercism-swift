func totalBirdCount(_ birdsPerDay: [Int]) -> Int { 
  return birdsPerDay.reduce(0, +)
}

func birdsInWeek(_ birdsPerDay: [Int], weekNumber: Int) -> Int {
  guard birdsPerDay.count % 7 == 0 else { return -1 }
  
  let weeksInArray: Int = birdsPerDay.count / 7
  guard (0...weeksInArray).contains(weekNumber) else { return -1 }
  
  let weekStartIndex: Int = 7 * (weekNumber - 1)
  let weekEndIndex = weekStartIndex + 7
  var total = 0
  for i in weekStartIndex..<weekEndIndex {
    total += birdsPerDay[i]
  }

  return total
}

func fixBirdCountLog(_ birdsPerDay: [Int]) -> [Int] {
  var ret = birdsPerDay
  for i in stride(from: 0, to: birdsPerDay.count, by:2) {
    ret[i] += 1
  }

  return ret
}
