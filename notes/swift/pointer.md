# 指针种类
`Unsafe[Mutable][Raw][Buffer]Pinter`
```
unsafe：不安全的，并不是真的不安全，大概是提示开发者少用。
Write Access：可写入。
Collection：像一个容器，可添加数据。
Strideable：指针可使用 advanced 函数移动。
Typed：是否需要指定类型（范型）。
```

UnsafePointer, UnsafeMutablePointer, OpaquePointer

C | Swift | 注解
| --- | --- | --- |
const Type * | UnsafePointer<Type> | 指针可变，指针指向的内存值不可变
Type * | UnsafeMutablePointer<Type> | 指针和指针指向的内存值均可变
ClassType * const * | UnsafePointer<UnsafePointer<Type>> | 指针的指针：指针不可变，指针指向的类可变
ClassType ** | UnsafeMutablePointer<UnsafeMutablePointer<Type>> | 指针的指针：指针和指针指向的类均可变
ClassType ** | AutoreleasingUnsafeMutablePointer<Type> | 作为OC方法中的指针参数
const void * | UnsafeRawPointer | 指针指向的内存区，类型未定
void * | UnsafeMutableRawPointer | 指针指向的内存区，类型未定
StructType * | OpaquePointer | c语言中的一些自定义类型，Swift中并未有相对应的类型
int a[] | UnsafeBufferPointer/UnsafeMutableBufferPointer | 一种数组指针

