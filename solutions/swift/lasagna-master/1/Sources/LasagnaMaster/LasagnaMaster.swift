// TODO: define the 'remainingMinutesInOven' function
func remainingMinutesInOven(elapsedMinutes: Int, expectedMinutesInOven: Int = 40) -> Int {
  return expectedMinutesInOven - elapsedMinutes
}

// TODO: define the 'preparationTimeInMinutes' function
func preparationTimeInMinutes(layers: String...) -> Int {
  return 2 * layers.count
}

// TODO: define the 'quantities' function
func quantities(layers: String...) -> (noodles: Int, sauce: Double) {
  let noodleLayers = layers.filter { $0 == "noodles" }
  let sauceLayers = layers.filter { $0 == "sauce" }

  return (noodles: noodleLayers.count * 3, sauce: Double(sauceLayers.count) * 0.2)
}

// TODO: define the 'toOz' function
func toOz(_ amount: inout (noodles: Int, sauce: Double)) {
  amount.sauce = 33.814 * amount.sauce
}

// TODO: define the 'redWine' function
func redWine(layers: String...) -> Bool {
  let meatLayers = (layers.filter { $0 == "meat" }).count
  let sauceLayers = (layers.filter { $0 == "sauce" }).count
  let ricottaLayers = (layers.filter { $0 == "ricotta" }).count
  let mozzarellaLayers = (layers.filter { $0 == "mozzarella" }).count
  let bechamelLayers = (layers.filter { $0 == "béchamel" }).count

  return !(mozzarellaLayers + ricottaLayers + bechamelLayers > meatLayers + sauceLayers)
}