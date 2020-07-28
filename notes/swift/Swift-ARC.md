# ARC

Swift 用 ARC 管理内存，和 OC 类型，ARC 适用于 类（class）的实例对象，而 Structure 和 enumerations 则是 value type （值类型），不是引用类型，不是通过引用的方式进行保存和传递。

## ARC 如何工作
每当创建一个类的对象实例时， ARC 会 allocate 一块内存来保存 instance 的信息。这块内存包含 实例的类型， properties 的值.

当一个对象不再被需要时，ARC 会释放其内存空间

然而，当 ARC 销毁一个还在被使用的对象后，这个对象的 properties 将不再可用，如果继续访问其 property 或调用其方法，会导致 crash。

为了防止释放还在使用中的对象， ARC 会记录所有引用该对象的属性、常量和变量。只要还有有效的引用存在，ARC 就不会释放该对象。

实现方式是当有属性、常量或变量引用对象时，将会创建一个强引用。之所以成为强引用时因为他会强持有该对象，只要这个强引用存在，就不允许释放这个对象。

## 强引用循环

强引用循环会导致对象的引用计数永不为零，造成内存泄漏，这个问题可以通过 weak 或 unowned 引用来解决。

强引用循环例子
```
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john
```

## 解决循环引用
Swift 提供了两种解决循环引用的方案：weak reference 和 unowned reference
weak reference 和 unowned reference 可以实现一个对象引用另一个对象却不产生强引用
当一个对象生命周期更短时，就可以用 weak 引用他 ———— 他会更早被释放。