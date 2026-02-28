func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
  let numYearsToPay = 5
  let monthlyPayment = price / Double(numYearsToPay * 12)
  let monthlyPaymentUpperBound = monthlyBudget * 1.1

  if (monthlyPayment <= monthlyBudget) {
    return "Yes! I'm getting a \(vehicle)"
  }
  if (monthlyPayment <= monthlyPaymentUpperBound) {
    return "I'll have to be frugal if I want a \(vehicle)"
  }
  return "Darn! No \(vehicle) for me"
}

func licenseType(numberOfWheels wheels: Int) -> String {
  let vehicleType = if wheels == 2 || wheels == 3 {
    "motorcycle"
  } else if wheels == 4 || wheels == 6 {
    "automobile"
  } else if wheels == 18 {
    "commercial trucking"
  } else {
    "NA"
  }

  if (vehicleType == "NA") {
    return "We do not issue licenses for those types of vehicles"
  }

  let vowels = ["a", "e", "i", "o", "u"]
  let a_an = vowels.contains(where: vehicleType.hasPrefix) ? "an" : "a"
  return "You will need \(a_an) \(vehicleType) license for your vehicle"
}

func calculateResellPrice(originalPrice: Int, yearsOld: Int) -> Int {
  let percentOfOriginalPrice = if yearsOld < 3 {
    0.8
  } else if yearsOld < 10 {
    0.7
  } else {
    0.5
  }

  return Int(Double(originalPrice) * percentOfOriginalPrice)
}
