## 1.iOS
1. hook block
hook block 来修改 block 的内部实现, 最终实现调用 block 时,运行自己的代码. 

2. 列表性能优化
```
一. cell 的复用
1. 延迟 cell 数据设置时机, 为了提高效率我们应该把数据绑定的操作放在cell显示出来后再执行, 在tableView:willDisplayCell:forRowAtIndexPath:（以后简称 willDisplayCell）方法中绑定数据。
willDisplayCell 在 cell 在tableview展示之前就会调用
2. 复用 cell
二. cell 的渲染
(1)当有图像时，预渲染图像，在bitmap context先将其画一遍，导出成UIImage对象，然后再绘制到屏幕，这会大大提高渲染速度。具体内容可以自行查找“利用预渲染加速显示iOS图像”相关资料
(2)渲染最好时的操作之一就是混合(blending)了,所以我们不要使用透明背景，将cell的opaque值设为Yes，背景色不要使用clearColor，尽量不要使用阴影渐变等；
(3)由于混合操作是使用GPU来执行，我们可以用CPU来渲染，这样混合操作就不再执行。可以在UIView的drawRect方法中自定义绘制；
(4)减少subviews的个数和层级。子控件的层级越深，渲染到屏幕上所需要的计算量就越大；如多用drawRect绘制元素，替代用view显示；
(5)少用subviews的透明图层。对于不透明的View，设置opaque为YES，这样在绘制该View时，就不需要考虑被View覆盖的其他内容(尽量设置Cell的view为opaque，避免GPU对Cell下面的内容也进行绘制)；
(6)避免CALayer特效（shadowPath）。 给Cell中View加阴影会引起性能问题，如下面代码会导致滚动时有明显的卡顿：

```

3. 动画暂停的实现


4. 如何写单元测试(构建单元测试类?)
```

```

5. 描述 gcd 中 QoS 
```
Dispatch Queue 类型
- main dispatch queue, 串行队列
- global dispatch queue, 提供四个全局并发队列, 高、默认、低以及后台, 不能创建,只能获取
- user create queue, dispatch_queue_create创建队列, DISPATCH_QUEUE_SERIAL/DISPATCH_QUEUE_CONCURRENT

Quality of Service(QoS)
苹果提供了几个Quality of Service枚举来使用:user interactive, user initiated, utility 和 background，其中主要涉及到CPU调度的优先级、IO优先级、任务运行在哪个线程以及运行的顺序等等.

- global, 通过参数设置 dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)
- user, 需要 dispatch_queue_attr_t 来设置
```

6. iOS13 的适配
```
  1. modalPresentationStyle
  2. StoreKit 只支持竖屏弹出
  3. LaunchImage 被弃用
  4. 工程结构, 增加 scene, 主要为 iPad 和 mac 多窗口服务
  5. DeviceToken 获取, 格式发生变化, 可能影响推送
  6. 废弃UIWebView APIs
  7. Dark mode, 增加systemColor, dynamicColor, UIImage, blur样式, XCode 支持调试暗黑模式
  8. KVC 限制, set 系统私有 value 会导致 crash
  9. sign in with apple 
  10. @available 底层实现更新, XCode11 编译的包, 会导致 XCode10 编译出错
```

7. swift 初始化的修饰符 DESIGNATED，CONVENIENCE 和 REQUIRED

8. 为什么用fmdb, fmdb 里面做了那些事情?

9. iOS autolayout 是怎么实现的, 如果让你来做，你会怎么实现。使用过程中有哪些需要注意的地方

10. 设计一个发朋友圈断网重试的上传逻辑,数据库怎么设计
```
1. 网络中断时把数据写在本地数据库
2. 检测网络变化, 有网络时把数据上传到服务器
3. 
```

11. ios 12 是怎么优化启动速度的


12. 宏定义和static的区别, 两个m文件中有相同的定义能正常编译吗?
```
1. 区别
宏: 编译期间替换代码,如果有重复,取最近的一个
static: 运行期间存储到静态存储区
2. 两个m文件中有相同的定义时
宏: 可以编译
static: 可以编译, 但 .h 文件中有相同的定义时无法编译, 报错有重复定义.
```

13. iOS class 内存布局
```
struct objc_class {
    Class isa  OBJC_ISA_AVAILABILITY;
#if !__OBJC2__
    Class super_class                                        OBJC2_UNAVAILABLE;
    const char *name                                         OBJC2_UNAVAILABLE;
    long version                                             OBJC2_UNAVAILABLE;
    long info                                                OBJC2_UNAVAILABLE;
    long instance_size                                       OBJC2_UNAVAILABLE;
    struct objc_ivar_list *ivars                             OBJC2_UNAVAILABLE;
    struct objc_method_list **methodLists                    OBJC2_UNAVAILABLE;
    struct objc_cache *cache                                 OBJC2_UNAVAILABLE;
    struct objc_protocol_list *protocols                     OBJC2_UNAVAILABLE;
#endif

} OBJC2_UNAVAILABLE;
```

14. app 启动性能优化(抖音启动性能优化)
page

15. urlsession 下载文件如何监控进度

16. 信号量的应用

17. dispatch_once 的线程安全是如何实现的

18. A B 两个单例对象互相调用的问题, 会产生什么结果

19. 深拷贝与浅拷贝

20. 从浏览器输入 url 到展示网页的过程 (注意网页缓存的问题)

21. 如何 KVO multableArray 的 count 
* count 为 readonly, 不能被子类重载 setter, 所以无法 kvo

22. kvo 的实现原理
```
1. 当一个obj有观察者时, 会动态创建 obj 的类的子类
2. 在子类中重载被观察的 property, 重写起 setter 方法
3. 在 setter 中调用 - willChangeValueForKey: 和 - didChangeValueForKey:
4. 当 property 没有观察者时, 删除重载的 setter
5. 当 obj 没有观察者时, 会把子类删除
```

23. 如何获取加载图片的大小(物理尺寸)

24. oc cpp 混编

25. 线程(Thread)和队列(Queue)的关系

26. 有没有用代码规范，API规范

27. 触摸事件传递，如何让view响应frame外部的事件，A B两个view，是父子关系，如何让B响应A的触摸事件

28. 有哪些设计模式

29. swift 面向协议编程

30. kv类型的数据库有了解吗

31. sqlite 和 mongodb 一样吗? 区别在哪?

32. 有那些对称加密和非对称加密方法,对称加密为什么比非对称加密性能好

33. 静态库和动态库的区别? 自己制作的动态库和苹果动态库的区别?
```
* 静态库和动态库的区别
1. 在 app 链接时，静态库会被完整地复制到可执行文件中，动态库则不会, 自己创建的动态库会拷贝到 .app 的 Framework 文件夹下.
2. 程序运行时由系统动态加载到内存，供程序调用，系统只加载一次，多个程序共用，节省内存
3. 一般如果是静态Framework的话，资源打包进Framework是读取不了的。静态Framework和.a文件都是编译进可执行文件里面的。只有动态Framework能在.app的Framework文件夹下看到，并读取.framework里的资源文件。
* 自己制作的动态库和苹果动态库的区别
1. 自己创建的动态库就在.app目录下的Framework文件夹里
2. 自己创建的动态库只允许自己的 app 使用, 系统动态库所有 app 公用
```

34. 除了 json 还知道其他数据格式吗? protolbuf 和 json 的区别是什么, 为什么性能好?

35. cocoapods 工作原理

36. xcworkspace 中包含哪些信息

37. swift 中 protocol 和 oc 有什么区别? 
    1. 可以有默认实现
    2. optional 处理方式不一样
    3. 可以实现类似多继承的效果

38. viewController 的生命周期

39. app 的生命周期

40. 什么是 runtime

41. 什么是 runloop

42. KVO 底层是怎么实现的

43. MRC copy 怎么写 setter

44. iOS 怎么做内存管理, ARC 是怎么实现的

45. iOS 有哪些文件持久化的方法

46. property 的修饰词有哪些

47. atomic 为什么不能保证线程安全

48. 怎么实现 hook 

49. block 的底层是怎么实现的, property 为 block 应该如何选择修饰词?
```
1. block 的底层实现
其中包含 isa 指针、FuncPtr、Block_Size, 可以看作是个 oc 对象, 包含函数指针
2. block property 修饰符
MRC 下 copy, ARC 下 strong 和 copy 相同, 都会执行 copy 操作, 把 stack block copy 为 malloc block
3. block 类型
global, 数据区域(.data区),没有捕捉外部变量的block
stack, 栈区,捕捉了外部变量,但block本身没有copy
malloc, 堆区,捕捉了外部变量,有block本身没有copy, ARC下会有几种情况自动copy,block作为函数返回值时,block赋值给__strong指针,block作为 CocoaAPI中方法名含有 usingBLock 的方法参数时, block作为 GCD API的方法参数时
4. 外部变量捕捉
stack block, 不会对 aoto 类型的变量产生强引用
malloc block, 会对根据 auto 变量的修饰符(__strong, __weak, __unsafe_unretain)做出相应的操作, 形成强引用或者弱引用
5. hook block

6. block 编译后会生成一个函数,把`内部捕捉的变量`作为参数传递给函数
7. __block 修饰符会把修饰的对象封装成一个对象,解决block内部无法修改auto变量值的问题
```

50. 多线程间如何通讯

51. MVC 和 MVVM, MVP 的区别

52. 如何实现一个倒计时抢购的页面

53. isEqual 和 hash 的关系

54. static 关键词的作用

55. 有哪些常用 llvm 命令

56. 如何实现一个单例
```
static singleT
```

57. 线程和进程的区别? 他们之间的关系?

58. UIView 的生命周期


59. swift 如何禁止一个类被继承
final 关键词

60. weak 和 assign 的区别, weak 底层是怎么实现的?
```
* weak 底层实现
runtime 维护了一个全局的 weak 表, 结构是 hash table, key 是被引用对象的指针地址, v 是一个数组,存所有 weak 修饰的 property, weak table 有 spin lock 保证线程安全. 当有新的 weak 变量引用对象时, 会将新的变量存储到 weak table 中. 当对象调用 dealloc 的时候, 会清理所有相关的 weak 指针, 将其置为 nil.

* weak 的线程安全
1. weak table 的线程安全, weak.h 文件中有注释写到使用了 spin lock 来保证线程安全, runtime 主要会在 resize 的时候修改 weak table 本身的数据
2. weak table 中 kv 的线程安全, 主要靠 NSObject 来保证, NSObject 中对 weak 表的操作都有锁来保证线程安全
3. 当一个对象正在执行 dealloc 的时候, 其他 weak 指针的获取也是线程安全的, 获取的值是 nil. 
weak 指针的获取是通过 objc_loadWeakRetained 函数来实现的, 读取 weak 表有锁, 当 dealloc 开始时, 会标记 deallocating, 新增 weak 引用时会判断是否在执行 deallocating, 来决定是否继续执行插入逻辑.

* weak 和 assign 区别
weak 用于修饰对象类型的 property, assign 常用于修饰 值类型. weak 修饰的 property 当指向的对象销毁时,会被置为 nil. assign 修饰的 property 不会被置为 nil, 可能出现野指针的问题.
```

61. hash table 查找的时间复杂度是什么?
```
O(1)
```

62. NotificationCenter 的底层是怎么实现的?
```

```

63. 消息转发的步骤
```

```

64. 如何 debug crash
```

```

65. http 和 https 的区别? https 请求的流程?
```

```

66. iOS 多线程编程的工具
```
GCD, NSThread, NSOperation
```

67. 什么是循环引用? 如何解决循环引用?
```
循环引用: 两个或多个对象建立了强引用,形成一个环,导致循环引用的对象无法正常释放
解决: weak, 手动打破循环引用
```

68. 一个对象 alloc 的时候做了哪些事情?

69. block 中变量的生命周期

70. FMDB 如何保证数据的一致性的?

71. 如何写一个线程安全的 NSMutableArray

72. tableView怎么优化图片加载吗？用户疯狂滑动，你怎么缓存图片？又慢慢滑动了呢？
思路1:
    cell 展示后做延时, 如果在栅栏时间内消失,则不开始加载数据,否则加载数据
    1. tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    2. tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath)
思路2:
    tableView.isDragging 来控制滑动中不加载, 不滑动加载

73. 什么是 swiftUI

74. safe area

75. swift optional

76. runloop 有几种状态

77. NSCache

78. 自己设计一个缓存器

79. SDWebImage

80. 二叉树先序遍历(递归和非递归)
```
递归
recourse

非递归
while
```

81. 怎么实现LRU

82. MVC 的一些缺点

83. 讲一讲其他架构

84. 你知道哪些编码方式
```
字符集: ASCII, GBK, Unicode
编码方式: UTF-8(是Unicode的一种编码方式), GBK2312
Base64


```

85. 对线程的方式和他们的区别

86. 队列和线程的关系

87. 有哪些锁

88. 属性的关键词

89. assign 可以用于 OC 对象吗

90. copy 和 strong 的区别

91. weak 如何实现自动赋 nil

92. 为什么不可变对象要用 copy

93. Pod update 和 Pod install 的区别

94. layoutIfNeeded 和 setNeedsLayout 的区别

95. 抓包工具抓取 HTTPS 的原理

96. isEqual 和 hash 的关系

97. bitmap 的结构

98. 可变数据的实现原理

99. 如何 hook 一个对象方法, 而不影响其他对象

100. 如何避免 if...else

101. 自旋锁和互斥锁的区别

102. 介绍项目，主要介绍自己强项一点的地方

103. 数组copy后里面的元素会复制一份新的吗


104. 数组的浅拷贝与深拷贝

105. TCP为什么是三次握手和四次挥手

106. 你平时怎么解决网络请求的依赖关系：当一个接口的请求需要依赖于另一个网络请求的结果
办法2：逻辑：在上一个网络请求的响应回调中进行下一网络请求的激活
办法3：信号量
办法4：group

107. 关于RAC你有怎样运用到解决不同API依赖关系
```
RAC: Reactive Cocoa
信号的依赖：使用场景是当信号A执行完才会执行信号B,和请求的依赖很类似,例如请求A请求完毕才执行请求B,我们需要注意信号A必须要执行发送完成信号,否则信号B无法执行
```

108. 编译链接你有了解多少


109. 简单介绍下KVO的用法


110. 你认为自动布局怎么实现的
解析：先提到系统提供的NSLayoutConstraint，再介绍Masonry怎样基于它的封装？

然而面试官继续问AutoLayout原理是？它的原理就是一个线性公式！比如，创建约束，iOS6中新加入了一个类：NSLayoutConstraint。它的约束满足这个公式：

111. 快排的思想？怎么实现（说思路）？复杂度是多少？归并呢？

112. 知道runtime吗？介绍一下runtime怎么工作的？还能做些什么？
```
1. iOS runtime 是一个 runtime library,提供了oc动态性的能力
2. 作用
- Class 相关: 创建、添加、初始化 class, 获取 class 的信息, class 相关的动态函数
- Instance 相关: 实例变量相关的动态函数, 获取对象信息, 绑定对象. 获取 property 内容
- 消息相关: 当调用一个方法时,会最终转化为 objc_msgSend, 以消息的形式调用
- method 相关: method 调用, 替换, swizzling. selector 相关的内容
- library 相关: 获取 image 相关信息
- protocol 相关: 注册、添加、获取 protocol 相关内容
- data 数据结构, class 内存布局
- 数据类型, id 类型
```

113. iOS的内存管理机制
MRC ARC，栈堆的区别和怎么回收
```
.data: 全局变量,静态变量
.bss: 即 Block Started by Symbol， 未初始化的全局变量和静态变量
heap: 堆, malloc, realloc, free 来控制
stack: 栈, 函数调用时保存函数现场

retainCount

```

114. 简单的数据结构知道吗？手撸一下链表结构吧，再写个插入和链表反转
```
struct Node {
    struct Node *next;
    int val;
};

void insert(Node *head, int p, int x) {
    Node *tmp = head;
    for (int i=0; i<p; i++) {
        if (tmp==NULL) return -1;
        while (i<p-1) {

        }
    }
}

void reverse(Node *head) {
    Node *currentNode = head;
    Node *nextNode = head->next;
    Node *tail = head;
    while(nextNode != NULL) {
        Node *t = nextNode->next;
        nextNode->next = currentNode;
        currentNode = nextNode;
        nextNode = t;
    }
    tail->next = NULL;
    return currentNode;
}
```

115. 如何实现串行写, 并行读
```
/* 思路: 读取放到并行队列中, 写入使用 barrier, 当执行写入时不会执行读取任务
 */
dispatch_barrier_async 
dispatch_barrier_async用于等待前面的任务执行完毕后自己才执行，而它后面的任务需等待它完成之后才执行。

_syncQueue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_CONCURRENT);
- (NSString *)someString {
    __block NSString *localSomeString;
    dispatch_sync(_syncQueue, ^{
        localSomeString = _someString;
    });
    return localSomeString;
}
- (void)setSomeString:(NSString *)someString {
    dispatch_barrier_async(_syncQueue, ^{
        _someString = someString;
    });
}
```

116. 常用 debug 命令
```
p, po, e, bt, n, po $n,
```

117. ViewController 嵌套
```

```

118. +load 方法
```
1. 在调用 main 函数之前调用
2. 先调用父类的 load, 再调用 class 的 load, 在调用 category 的 load. 顺序: superclass -> subclass -> category
3. 调用时机早,可以用于 method swizzling

* 如果有 ClassA, CategoryA, ClassB, CategoryB, B继承于A ?
CategoryA 中有 methodB, ClassB 中也有 methodB, 那么 B 对象调用 methodB 时, 执行哪一个?
load 顺序: ClassA -> ClassB -> CategoryA -> CategoryB, 其中CategoryA,CategoryB的顺序不定,需要看编译器中设置文件的顺序.

* 父类的方法, 会缓存在父类还是缓存在子类?
```

119. 反射
```
1. Objective-C 是动态语言，所有的消息都是在 Runtime 进行派发的
2. objc_msgSend 是 C 函数
target、selector、arguments、return value，
3. performSelector
使用 performSelector 给对象发送消息有几个短板
- 在 ARC 场景下 performSelector 可能会造成内存泄漏
- performSelector 至多接收 2 个参数，如果参数多余 2 个，我们就无法使用 performSelector 来向对象发送消息了。
- performSelector 限制参数类型为 id，以标量数据(int double NSInteger 等)为参数的方法使用 performSelector 调用会出现各种各样诡异的问题
4. NSInvocation
- 创建方法的签名 NSMethodSignature
- 创建 NSInvocation
- NSInvocation 对象设置 target (消息接受对象) 和 selector
- NSInvocation 对象设置 arguments
- 调用 invoke 来调用目标方法
```
120. 代码规范

121. weak 底层是如何实现线程安全的
```
1. 
```

122. bitcode 做了什么
```
1. 编译过程
前端 -> common Optimizer -> 后端
前端将目标语言编译成 bitcode

2. bitcode 设置项
- 打开bitcode后, 对于支持 bitcode 的架构, 会在编译过程中生成 bitcode.
- 对于 archive build, 会在链接后的二进制文件中生成 bitcode, 并用于 app store 提交
- 对于其他 build, 编译器、链接器会检查代码是否满足开启 bitcode, 但并不会真的生成 bitcode
```

123. @strongify和@weakify 两个宏


124. wdwebimage 对于 tableviewCell 加载图片做了哪些优化


125. iOS unbutton 响应外部区域的点击
```
1. 事件传递
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event;
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event;
2.思路: 重载事件传递函数
-(UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    CGRect rect = [self enlargedRect];
    if(CGRectEqualToRect(rect, self.bounds)){
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}
```

126. 想使用自定义类型作为 Dictionary 的 key, 需要做哪些事?
```
Using Custom Keys
In most cases, Cocoa-provided objects such as NSString objects should be sufficient for use as keys. In some cases, however, it may be necessary to use custom objects as keys in a dictionary. When using custom objects as keys, there are some important points to keep in mind.
Keys must conform to the NSCopying protocol. Methods that add entries to dictionaries—whether as part of initialization (for all dictionaries) or during modification (for mutable dictionaries)— don’t add each key object to the dictionary directly. Instead, they copy each key argument and add the copy to the dictionary. After being copied into the dictionary, the dictionary-owned copies of the keys should not be modified.
Keys must implement the hash and isEqual: methods because a dictionary uses a hash table to organize its storage and to quickly access contained objects. In addition, performance in a dictionary is heavily dependent on the hash function used. With a bad hash function, the decrease in performance can be severe. For more information on the hash and isEqual: methods see NSObject.
Important: Because the dictionary copies each key, keys must conform to the NSCopying protocol. Bear this in mind when choosing what objects to use as keys. Although you can use any object that adopts the NSCopying protocol and implements the hash and isEqual: methods, it is typically bad design to use large objects, such as instances of NSImage, because doing so may incur performance penalties.

------
note:
- 需要实现 NSCoping 协议, 需要重载 isEqual 和 hash 函数.
NSMutableDictionary 在 setKV 时会对 key 对象做 copy 操作,所以 key 必须遵守 NSCoping 协议.
Dictionary 底层使用 hash map 存储,会调用 key 的 hash 函数来获取 hash 值. 同时还会调用 isEqual 来判断 key 是否有‘重复’, 为了保证一致性, 需要同时重载 isEqual 和 hash.
# setKV 流程: 调用 hash 计算 k 的 hash, 调用 isEqual 判断是否有重复, hash table 设置 v
# getV 流程:  调用 hash 计算 k 的 hash, 调用 isEqual 判断是否有 key 相同, 最后取值

1. 只重载 isEqual 不重载 hash, 可能出现 value = nil 的情况
2. 只重载 hash 不重载 isEqual 相当于无效
```

127. gcd 中 block 如何 cancel
```
1. dispatch_block_cancel & dispatch_block_create

2. NSOperation
```

128. 如何加快编译速度
```
1. Optimization Level
Built Setting里的一个参数，Optimization Level是指编译器的优化层度，优化后的代码效率比较高，但是可读性比较差，且编译时间更长。
2. pod里的Optimization Level
我们在使用pod的时候，每一个pod其实都是一个target，它有自己的Optimization Level。cocoapods默认给每一个pod的Optimization Level设置的是Fastest, Smallest，也就是说执行所有的优化和减少内存占用空间。
3. 设置xcode编译的线程数
defaults write xcodebuild PBXNumberOfParallelBuildSubtasks 8
4. Debug Information Format: 是否生成符号文件
在工程对应Target的Build Settings中，找到Debug Information Format这一项，将Debug时的DWARF with dSYM file改为DWARF。
5. 将Build Active Architecture Only改为Yes

```

## 2.数据库
1. 数据库索引

2. 为什么用fmdb

3. 数据库读写安全如何保证

4. 写入一万条数据,如何优化


## 3.算法
1. 从数组中找到第二大的数

2. 反转完全二叉树, 以及算法的时间复杂度

3. 有 M x N 个格子，从左上角到右下角一共有多少种路线
递归算法

4. 手写 lrucache 类

5. 写一个快速排序

6. 写一个冒泡排序

7. 编程题
1) 编写一个自定义类：Person，父类为NSObject
2) 该类有两个属性，外部只读的属性name，还有一个属性age
3) 为该类编写一个初始化方法 initWithName:(NSString *)nameStr，并依据该方法参数初始化name属性
4) 如果两个Person类的name相等，则认为两个Person相等

8. 编程题
RLE算法，编写一个函数，实现统计字符次数的功能：例如输入为aaabbccc，输出为a3b2c3。不限语言

解析：比较简单，可以参考这个blog.51cto.com/lanchaohuan…

9. 编程题：请实现一个函数，用来判断一颗二叉树是不是对称的。注意，如果一个二叉树同此二叉树的镜像是同样的，定义其为对称的.

解析：思路，递归，从根节点开始，判断左右子节点是否对称，若对称，递归，若不对称，则返回NO。

10. 给出两个字符串，只包含字母，本身会有重复。求s1和s2的重复字符。
思路:

11. 脑筋急转弯 4个人过桥，只有1个手电筒（没有手电摔死人哦），只能同时2人同时过。4人过桥时间分别为1 2 5 10，问最短需要多少时间？

12. 遍历二叉树(递归/非递归), 时间复杂度呢?



## ref
1. [关于GCD开发的一些事儿](https://www.jianshu.com/p/f9e01c69a46f)
2. [WWDC iOS13 Dark Mode](https://developer.apple.com/videos/play/wwdc2019/214/)
3. [iOS13 适配要点](http://www.cocoachina.com/articles/83448#header)
4. [objc kvo简单探索](http://blog.sunnyxx.com/2014/03/09/objc_kvo_secret/)
5. [iOS-Block本质](https://www.jianshu.com/p/4e79e9a0dd82)
6. [把OC代码 编译成C/C++](https://www.jianshu.com/p/71bdafff72ac)
7. [深入理解iOS开发中的isa指针](https://www.jianshu.com/p/9e975a1cab93)
8. [Objective-C Runtime](https://hit-alibaba.github.io/interview/iOS/ObjC-Basic/Runtime.html)
9. [iOS Runtime详解](https://juejin.im/post/5ac0a6116fb9a028de44d717)
10. [运行时Hook所有Block方法调用的技术实现](https://juejin.im/post/5ca0ca6e51882567e32fc44b)
11. [weak指针的线程安全和自动置nil的深度探讨](https://www.jianshu.com/p/edbd1ec314aa)
12. [iOS里的动态库和静态库](https://www.jianshu.com/p/42891fb90304)
13. [如何加快编译速度](https://www.zybuluo.com/qidiandasheng/note/587124)
14. 