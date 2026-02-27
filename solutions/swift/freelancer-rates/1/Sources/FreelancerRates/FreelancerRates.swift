func discountedHourlyRateFrom(hourlyRate: Double, withDiscount discount: Double) -> Double {
  // discount is NOT a percent
  let discountPercent = discount / 100.0
  return hourlyRate * (1 - discountPercent)
}

func dailyRateFrom(hourlyRate: Double) -> Double {
  // How much to pay the freelancer for a single day
  let hoursWorkedPerDay = 8.0
  return hourlyRate * hoursWorkedPerDay
}

func monthlyRateFrom(hourlyRate: Double, withDiscount discount: Double) -> Double {
  // How much to pay the freelancer for a single month
  let numWorkDays = 22
  let discountedHourlyRate: Double = discountedHourlyRateFrom(
    hourlyRate: hourlyRate,
    withDiscount: discount
  )
  return dailyRateFrom(hourlyRate: discountedHourlyRate) * Double(numWorkDays)
}

func workdaysIn(budget: Double, hourlyRate: Double, withDiscount discount: Double) -> Double {
    // Given a budget, how many days can the freelancer work?
    let discountedHourlyRate = discountedHourlyRateFrom(
      hourlyRate: hourlyRate,
      withDiscount: discount
    )
    let dailyRate = dailyRateFrom(hourlyRate: discountedHourlyRate)
    return (budget / dailyRate).rounded(.down)
}