
enumeration 定义了一个数据类型，这个类型的数据关联一组数据，可以让安全的使用。

在 C 语音中， enum 类型的 case 会被分配对应的 int 值。在 Swift 中 enum 更灵活，可以给每个 case 设置 case 值（raw value）, 但不强制。 raw value 的类型比较灵活，可以是 string， character， integer 或者 floating-point 类型, 但所有 case 的 raw value 必须是同一种类型。

除 raw value 外，可以给 enum 的 case 绑定一个值（associated value）, 与 raw value 不同的是，associated value 可以是不同类型的数据，类似其他语言中的 union 或 variant。

swift 中 enumerations 是 first-class 类型的，他们拥有很多传统上只有 class 才支持的 feature，比如可以根据当前值来计算的 property，可以根据当前值计算的实例方法（instance method）。同时还可以定义初始化方法来创建默认值，可以添加拓展方法，可以遵守协议来提供协议方法。（Properties, Methods, Initialization, Extensions, and Protocols）

### 语法

### 定义
```

enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

```

### 枚举使用
```
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
// Prints "Watch out for penguins"
```

### Iterating over Enumeration Cases
遍历

```
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
// Prints "3 beverages available"

for beverage in Beverage.allCases {
    print(beverage)
}
// coffee
// tea
// juice
```

### Associated Values
绑定的值

```
// 绑定不同类型的值
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

// 使用
var productBarcode = Barcode.upc(8, 85909, 51226, 3)

productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP."

```

### Raw Values
case 本身的值
```
// 可以设置每个 case 的值

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
```

#### 隐式赋值
```
// 指定一个 int 类型，其他自增
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let earthsOrder = Planet.earth.rawValue
// earthsOrder is 3


// 无显式说明，raw value 默认为 case 名称的字符串
enum CompassPoint: String {
    case north, south, east, west
}

let sunsetDirection = CompassPoint.west.rawValue
// sunsetDirection is "west"

```

#### 通过 raw value 创建 enum 变量
```
let possiblePlanet = Planet(rawValue: 7)
// possiblePlanet is of type Planet? and equals Planet.uranus
```
| 通过 raw value 创建可能会失败，因为会出现没有 case 匹配 raw value 的情况


### 递归枚举
swift enum 支持递归，即：enum 类型中的 case 绑定的 raw value 中，包含一个或多个自身类型的值。这种情况需要在 case 前使用 `indirect` 来修饰，或者在 enum 类型前使用 `indirect` 来修饰。
```
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
```


### 嵌套枚举

```
enum Character {
  enum Weapon {
    case Bow
    case Sword
    case Lance
    case Dagger
  }
  enum Helmet {
    case Wooden
    case Iron
    case Diamond
  }
  case Thief
  case Warrior
  case Knight
}

```


### 小结
一个 enum 的 case 可以认为有三个值：name，raw value，associated value

https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html

https://swift.gg/2015/11/20/advanced-practical-enum-examples/

