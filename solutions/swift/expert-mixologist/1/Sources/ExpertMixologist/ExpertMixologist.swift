func timeToPrepare(drinks: [String]) -> Double {
    var totalTime = 0.0
    for drink in drinks {
        let lowered = drink.lowercased()
        let timeTaken: Double
        switch lowered {
        case "beer", "soda", "water":
            timeTaken = 0.5
        case "shot":
            timeTaken = 1.0
        case "mixed drink":
            timeTaken = 1.5
        case "fancy drink":
            timeTaken = 2.5
        case "frozen drink":
            timeTaken = 3.0
        default:
            timeTaken = 0.0
        }
        totalTime += timeTaken
    }
    return totalTime
}

func makeWedges(needed: Int, limes: [String]) -> Int {
    guard needed > 0 else { return 0 }

    var wedges = 0
    var limesCut = 0

    for lime in limes {
        if wedges >= needed { break }

        let numWedges: Int
        switch lime.lowercased() {
        case "small":
            numWedges = 6
        case "medium":
            numWedges = 8
        case "large":
            numWedges = 10
        default:
            numWedges = 0
        }

        wedges += numWedges
        limesCut += 1
    }

    return limesCut
}

func finishShift(minutesLeft: Int, remainingOrders: [[String]]) -> [[String]] {
    var minutes = Double(minutesLeft)
    var queue = remainingOrders

    while minutes > 0 && !queue.isEmpty {
        let order = queue.removeFirst()
        minutes -= timeToPrepare(drinks: order)
    }

    return queue
}

func orderTracker(orders: [(drink: String, time: String)]) -> (
    beer: (first: String, last: String, total: Int)?,
    soda: (first: String, last: String, total: Int)?
) {
    var beerFirst: String?
    var beerLast: String?
    var beerTotal = 0

    var sodaFirst: String?
    var sodaLast: String?
    var sodaTotal = 0

    for (drink, time) in orders {
        let d = drink.lowercased()
        if d == "beer" {
            beerTotal += 1
            if beerFirst == nil || time < beerFirst! { beerFirst = time }
            if beerLast == nil || time > beerLast! { beerLast = time }
        } else if d == "soda" {
            sodaTotal += 1
            if sodaFirst == nil || time < sodaFirst! { sodaFirst = time }
            if sodaLast == nil || time > sodaLast! { sodaLast = time }
        }
    }

    let beerResult: (first: String, last: String, total: Int)? =
        beerTotal > 0 ? (first: beerFirst!, last: beerLast!, total: beerTotal) : nil

    let sodaResult: (first: String, last: String, total: Int)? =
        sodaTotal > 0 ? (first: sodaFirst!, last: sodaLast!, total: sodaTotal) : nil

    return (beer: beerResult, soda: sodaResult)
}