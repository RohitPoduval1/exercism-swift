// TODO: Define the Size struct
struct Size {
  var width: Int = 80
  var height: Int = 60

  mutating func resize(newWidth: Int, newHeight: Int) {
    self.width = newWidth
    self.height = newHeight
  }
}

// TODO: Define the Position struct
struct Position {
  var x: Int = 0
  var y: Int = 0

  mutating func moveTo(newX: Int, newY: Int) {
    self.x = newX
    self.y = newY
  }
}

// TODO: Define the Window class
class Window {
  var title: String
  let screenSize: Size = Size(width: 800, height: 600)
  var size: Size
  var position: Position
  var contents: String?

  init() {
    self.title = "New Window"
    self.size = Size()
    self.position = Position()
    self.contents = nil
  }

  init(title: String, contents: String?, size: Size = Size(), position: Position = Position()) {
    self.title = title
    self.contents = contents
    self.size = size
    self.position = position
  }

  func resize(to newSize: Size) {
    let maxWidth = screenSize.width - position.x
    let maxHeight = screenSize.height - position.y

    let clippedWidth = max(1, min(newSize.width, maxWidth))
    let clippedHeight = max(1, min(newSize.height, maxHeight))

    self.size.resize(newWidth: clippedWidth, newHeight: clippedHeight)
  }

  func move(to newPosition: Position) {
    let maxX = screenSize.width - size.width
    let maxY = screenSize.height - size.height

    let clippedX = max(0, min(newPosition.x, maxX))
    let clippedY = max(0, min(newPosition.y, maxY))

    self.position.moveTo(newX: clippedX, newY: clippedY)
  }

  func update(title: String) {
    self.title = title
  }

  func update(text: String?) {
    self.contents = text
  }

  func display() -> String {
    let nilContentsMessage = "[This window intentionally left blank]"
    return "\(self.title)\nPosition: (\(self.position.x), \(self.position.y)), Size: (\(self.size.width) x \(self.size.height))\n\(self.contents ?? nilContentsMessage)\n"
  }
}