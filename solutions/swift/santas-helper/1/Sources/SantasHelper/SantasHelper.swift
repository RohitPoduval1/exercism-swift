func getName(_ item: (name: String, amount: Int)) -> String {
  return item.name
}

func createToy(name: String, amount: Int) -> (name: String, amount: Int) {
  return (name, amount)
}

func updateQuantity(_ items: [(name: String, amount: Int)], toy: String, amount: Int) ->  [(name: String, amount: Int)] {
  var newItems = items
  for i in items.indices {
    if items[i].name == toy {
      newItems[i].amount = amount
    }
  }

  return newItems
}

func addCategory(_ items: [(name: String, amount: Int)], category: String) -> [(name: String, amount: Int, category: String)] {
  var newItems: [(name: String, amount: Int, category: String)] = []
  
  for i in items.indices {
    let newItem = (items[i].name, items[i].amount, category)
    newItems.append(newItem)
  }

  return newItems
}
