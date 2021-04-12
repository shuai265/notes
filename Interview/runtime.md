## runtime
1. 什么是 runtime


2. 用 runtime 做过什么



## class

1. load & initialize

load
load 当一个类加入到 runtime 过程中调用该类的 load 方法
特性：
调用顺序 父类-子类-子类category，如果有多个 category ，多个 category load 调用顺序会根据编译顺序调用

initialize
懒调用，当类第一次使用时会触发调用 initialize 方法
特性：
1. 如果类实现了 +initialize，则调用，没有实现则调用父类的 +initialize
2. 如果有 category 实现了 +initialize，则覆盖类原有的 +initialize
3. 如果一个类有多个 category 同时实现了 +initialize，则会根据编译顺序决议调用某个 category 的 +initialize

2. 内存布局

## 消息发送与转发
1. 消息机制


2. 消息转发


3. msgSend() & msgSendSuper()
eg：子类 Man 继承于 父类 Person，子类中调用 [super class] 打印结果是什么？
ans：Man
调用 self 和 super 区别在于编译后消息发送函数不同，分别对应 msgSend() & msgSendSuper()，其中第一个参数为消息接收者，都是self，查找方法的过程会到 NSObject 中找到函数，因为 self 是 Man，结果为 Man


4. 请问列举你在项目中用过 runtime 的场景
method-swizzling
其他组件的反射调用
数据打点使用消息转发统一处理
类名创建对线
category绑定对象

5. NSInvocation 和 preformSelector 区别
```

```
