func sliceSize(diameter: Double?, slices: Int?) -> Double? {
  /*
  Return area of a slice given diameter and number of slices
  */
  guard let pizzaDiameter = diameter else { return nil }
  guard let numSlices = slices else { return nil }
  if (pizzaDiameter < 0) || (numSlices < 1) { return nil }

  let pizzaRadius: Double = pizzaDiameter / 2.0
  let pizzaArea = Double.pi * pizzaRadius * pizzaRadius

  let sliceSize = pizzaArea / Double(numSlices)
  return sliceSize
}

func biggestSlice(
  diameterA: String, slicesA: String,
  diameterB: String, slicesB: String
) -> String {
  // Rather than handling edge cases for if sliceAreaA or sliceAreaB is nil, just
  // coalesce nil to -1 
  let sliceAreaA = sliceSize(diameter: Double(diameterA), slices: Int(slicesA)) ?? -1
  let sliceAreaB = sliceSize(diameter: Double(diameterB), slices: Int(slicesB)) ?? -1

  if sliceAreaA > sliceAreaB {
    return "Slice A is bigger"
  }
  else if sliceAreaB > sliceAreaA {
    return "Slice B is bigger"
  }
  else {
    return "Neither slice is bigger"
  }
}
