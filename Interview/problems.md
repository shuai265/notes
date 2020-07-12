## 1.iOS
1. hook block
hook block 来修改 block 的内部实现, 最终实现调用 block 时,运行自己的代码. 

2. 列表`性能优化
```
一. cell 的复用
1. 延迟 cell 数据设置时机, 为了提高效率我们应该把数据绑定的操作放在cell显示出来后再执行, 在tableView:willDisplayCell:forRowAtIndexPath:（以后简称 willDisplayCell）方法中绑定数据。
willDisplayCell 在 cell 在 tableView 展示之前就会调用
2. 复用 cell
二. cell 的渲染
(1)当有图像时，预渲染图像，在bitmap context先将其画一遍，导出成UIImage对象，然后再绘制到屏幕，这会大大提高渲染速度。具体内容可以自行查找“利用预渲染加速显示iOS图像”相关资料
(2)渲染最好时的操作之一就是混合(blending)了,所以我们不要使用透明背景，将cell的opaque值设为Yes，背景色不要使用clearColor，尽量不要使用阴影渐变等；
(3)由于混合操作是使用GPU来执行，我们可以用CPU来渲染，这样混合操作就不再执行。可以在UIView的drawRect方法中自定义绘制；
(4)减少 subViews 的个数和层级。子控件的层级越深，渲染到屏幕上所需要的计算量就越大；如多用drawRect绘制元素，替代用view显示；
(5)少用 subViews 的透明图层。对于不透明的View，设置opaque为YES，这样在绘制该View时，就不需要考虑被View覆盖的其他内容(尽量设置 Cell 的 view 为opaque，避免 GPU 对 Cell 下面的内容也进行绘制)；
(6)避免CALayer特效（shadowPath）。 给Cell中View加阴影会引起性能问题，如下面代码会导致滚动时有明显的卡顿：
(7)imageView 的显示：滑动的时候不加载，停止滑动才去加载
`[self performSelector:@selector(download:) withObject:url afterDelay:0 inModes:NSDefaultRunLoopMode];`
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

** 如何动态修改 qos? 如何修改图片加载的优先级？
a. gcd tableview停止滑动时，把图片加载放到 高优先级queue中，或者修改queue的优先级 dispatch_set_qos_class_floor
b. NSURLSessionTask 对象有个 priority 属性，可以修改优先级
c. NSOperation 有 QOS 属性


6. iOS13 的适配
```
  1. modalPresentationStyle
  2. StoreKit 只支持竖屏弹出
  3. LaunchImage 被弃用
  4. 工程结构, 增加 scene, 主要为 iPad 和 mac 多窗口服务
  5. DeviceToken 获取, 格式发生变化, 可能影响推送
  6. 废弃UIWebView APIs
  7. Dark mode, 增加systemColor, dynamicColor, UIImage, blur样式, XCode 支持调试暗黑模式 (WWDC2019)
  8. KVC 限制, set 系统私有 value 会导致 crash
  9. sign in with apple 
  10. @available 底层实现更新, XCode11 编译的包, 会导致 XCode10 编译出错
```

7. swift 初始化的修饰符 DESIGNATED，CONVENIENCE 和 REQUIRED
```

```

8. 为什么用fmdb, fmdb 里面做了那些事情?
```

```


9. iOS autolayout 是怎么实现的, 如果让你来做，你会怎么实现。使用过程中有哪些需要注意的地方
```
公式&要素 7个
公式: view1.attr1 = view2.attr2 * multiplier + constant
原理:
组织: 最顶层的视图一定是有具体的坐标信息, 内部的子控件布局时读取对应的约束, 例如 距父视图上偏移100pt, 就会被转化为 frame.orginal.y = 100; 最终形成GPU可以读取的坐标信息, 并且, 在存在多个控件的情况下, 所有的约束会被分解成 链状+树状 进行组织, 根视图就是拥有具体坐标信息的最顶层父视图, 下面的同等级控件以及更下级控件的排列顺序, 应该是按照添加顺序从左至右组织, 形成树组织
转化: 按照以上原理将所有的布局约束转化 树状节点组织, 读取的顺序类似于 BFS 的读取方式,先将横向的同级控件的约束转化为坐标点进行布局, 之后, 在布局深度的子叶节点.
总论: 因为GPU在形成光栅化渲染的时候, 一定是要获取到每个坐标点的颜色值, 因此, 无论是设置控件的 frame 或者是 autolayout, 在渲染之前, 实际上都会被转化为具体的坐标点, 因此, autolayout 相对frame来讲, 在GPU阶段是一样的, 主要的区别在于同样的效果在代码阶段表现是不同的, autolayout 使用了较为贴近自然语言的方式去描述位置信息, 所以在最终阶段, 相对 frame就多了一个转化阶段, 就是将自然语言描述的位置信息转化为具体的坐标信息

```

10. 设计一个发朋友圈断网重试的上传逻辑,数据库怎么设计
```
方案一
1. 网络中断时把数据写在本地数据库，标记待上传
2. 检测网络变化, 有网络时把数据上传到服务器

-----
方案二
缓存所有网络请求
```

11. ios 12 是怎么优化启动速度的
```
https://developer.apple.com/videos/play/wwdc2019/423/
启动阶段： System Interface - Runtime Init - UIKit Init - Application Init - Initial Frame Render - Extended
1. System Interface: 
    系统优化：
    - DYLD3:
        - Dynamic Linker loads shared libraries and frameworks
        - Introduces caching of runtime dependencies to improve warm launch (缓存 runtime 依赖，优化暖启动速度)
    开发者优化：
        - Avoid linking unused frameworks
        - Avoid dynamic library loading during launch
        - Hard link all your dependencies
2. Runtime Init
    do: Initializes the language runtime, Invokes all class static load methods
    使用 +[Class initialize] 做懒加载初始化，代替 +[Class load]
3. UIKit Init
    do: Instantiates the UIApplication and UIApplicationDelegate
    - Minimize work in UIApplication subclass
    - Minimize work in UIApplicationDelegate initialization
4. Application Init
    application:willFinishLaunchingWithOptions: 
    application:didFinishLaunchingWithOptions:
    - Defer unrelated work（推迟 UI 不相关的操作）
    - Share resources between scenes（多个scenes的情况，scenes之间共享资源）
5. Initial Frame Render
    Creates, performs layout for, and draws views
    - loadView``
    - viewDidLoad
    - layoutSubviews
    减少 view 层级，lazily load views
    优化 auto layout 的使用
6. Extended
    利用 os_signpost api 统计时常数据
    - 重启手机
    - 打开飞行模式
    - 使用没有 iCloud 账号
    - 使用 release 包
```


12. 宏定义和static的区别, 两个m文件中有相同的定义能正常编译吗?
```
1. 区别
宏: 编译期间替换代码,如果有重复,取最近的一个
static: 运行期间存储到静态存储区

2. 两个m文件中有相同的定义时
宏: 可以编译
static: 需要看情况
全局静态变量+局部静态变量，不可以编译
全局静态变量+全局静态变量，不可以编译
局部静态变量+局部静态变量，可以编译
```

13. iOS class 内存布局
```
================
# class 的内存布局

struct objc_class {
    Class isa  OBJC_ISA_AVAILABILITY;
#if !__OBJC2__
    Class super_class                                        OBJC2_UNAVAILABLE;
    const char *name                                         OBJC2_UNAVAILABLE;
    long version                                             OBJC2_UNAVAILABLE;
    long info                                                OBJC2_UNAVAILABLE;
    long instance_size                                       OBJC2_UNAVAILABLE;
    struct objc_ivar_list *ivars                             OBJC2_UNAVAILABLE;
    struct objc_method_list **methodLists                    OBJC2_UNAVAILABLE; //二级指针， methodLists 是一个二维数组
    struct objc_cache *cache                                 OBJC2_UNAVAILABLE;
    struct objc_protocol_list *protocols                     OBJC2_UNAVAILABLE;
#endif

} OBJC2_UNAVAILABLE;

===================
# category 的内存布局

struct category_t {
    const char *name;
    classref_t cls;
    struct method_list_t *instanceMethods;
    struct method_list_t *classMethods;
    struct protocol_list_t *protocols;
    struct property_list_t *instanceProperties;
};

```

14. app 启动性能优化(抖音启动性能优化)
检测耗时
page
1.main函数之前：
page
load 中代码换为 initialize 中
2.main函数之后
减少主线程操作
懒加载

15. urlsession 下载文件如何监控进度


16. 信号量的应用


17. dispatch_once 的线程安全是如何实现的
```
是线程安全的，不需要额外加锁
void
_dispatch_once(dispatch_once_t *predicate,
		DISPATCH_NOESCAPE dispatch_block_t block)
{
	if (DISPATCH_EXPECT(*predicate, ~0l) != ~0l) {
		dispatch_once(predicate, block);
	} else {
		dispatch_compiler_barrier();
	}
	DISPATCH_COMPILER_CAN_ASSUME(*predicate == ~0l);
}

- dispatch_once 为什么能做到既解决同步多线程问题又不影响性能呢？
dispatch_once主要是根据onceToken的值来决定怎么去执行代码。
当onceToken= 0时，线程执行dispatch_once的block中代码
当onceToken= -1时，线程跳过dispatch_once的block中代码不执行
当onceToken为其他值时，线程被线程被阻塞，等待onceToken值改变
```

18. A B 两个单例对象互相调用的问题, 会产生什么结果
```
1. dispatch_once 嵌套调用没有问题 (A->B)
2. 循环调用会造成死锁 (A->B->A)
```

19. 深拷贝与浅拷贝


20. 从浏览器输入 url 到展示网页的过程 (注意网页缓存的问题)


21. 如何 KVO multableArray 的 count 
* count 为 readonly, 不能被子类重载 setter, 所以无法 kvo ？？存疑

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
```
1.编译设置
a. 使用 cpp 后缀
b. 使用 mm 后缀
c. 设置 m 后缀的编译类型
d. build settings 中 设置 compile source as Objective-C++
2.调用
oc 调用 cpp
在 mm 文静中建立联系，调用 cpp
cpp 调用 oc
利用 c 函数做桥，将 oc 对象转为 void * 类型传入，在 c 函数中调用 oc。然后 cpp 中调用 c 函数。
```

25. 线程(Thread)和队列(Queue)的关系

26. 有没有用代码规范，API规范

27. 触摸事件传递，如何让view响应frame外部的事件，A B两个view，是父子关系，如何让B响应A的触摸事件

28. 有哪些设计模式
单例，观察者，adapter

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
json，yaml，protobuf
protobuf 直接根据类的信息解析数据

35. cocoapods 工作原理

36. xcworkspace 中包含哪些信息

37. swift 中 protocol 和 oc 有什么区别? 
    1. 可以有默认实现
    2. optional 处理方式不一样
    3. 可以实现类似多继承的效果

38. viewController 的生命周期

39. app 的生命周期

40. 什么是 runtime
动态库

41. 什么是 runloop
event loop


42. KVO 底层是怎么实现的
创建子类, 重写 setter, 调用 

43. MRC copy 怎么写 setter
```
//assign环境下
-(void)setName:(NSString *)name{

    _name = name;
}
//retain环境下
-(void)setName:(NSString *)name{
    
    if (_name != name) {
        [_name release];
        _name = [name retain];
    }
}
//copy环境下
-(void)setName:(NSString *)name{

    if (_name != name) {
        [_name release];
        _name = [name copy];
    }
}
```


44. iOS 怎么做内存管理, ARC 是怎么实现的
引用计数

45. iOS 有哪些文件持久化的方法
```
userDefault: [NSUserDefaults standardUserDefaults] set
coreData
sqlite
archive/plist: 两种方式都是存储 plist，但是结构不一样
```

46. property 的修饰词有哪些
weak/strong/assign
readonly/readwrite
nonnull/nullable
atomic/nonatomic

47. atomic 为什么不能保证线程安全
atomic 在 setter 中增加锁, 只能保证 setter 的线程安全. 当多线程同时修改堆中内容时, 仍然会有线程安全的问题.

48. 怎么实现 hook 
```
method swizzling
```

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
外部变量类型: global, static, 属性, 局部变量

stack block, 不会对 auto 类型的变量产生强引用
malloc block, 会对根据 auto 变量的修饰符(__strong, __weak, __unsafe_unretain)做出相应的操作, 形成强引用或者弱引用

5. hook block

6. block 编译后会生成一个函数,把`内部捕捉的变量`作为参数传递给函数
7. __block 修饰符会把修饰的对象封装成一个对象,解决block内部无法修改auto变量值的问题

8. block 是对象吗?
是对象, block 继承于 NSBlock, NSBlock 继承于 NSObject.
```

50. 多线程间如何通讯

51. MVC 和 MVVM, MVP 的区别

52. 如何实现一个倒计时抢购的页面

53. isEqual 和 hash 的关系

54. static 关键词的作用

55. 有哪些常用 llvm 命令
```
po, p, e, bt
```

56. 如何实现一个单例
```
static ClassA *instance = nil;
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [ClassA.alloc init];
    });
    return instance;
}
// 最好同时重载的函数
+ (id)allocWithZone:(struce _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}
+ (id)copyWithZone:(struct _NSZone *)zone {
    return inst;
}
+ (id)mutableCopyWithZone:(struct _NSZone *)zone {
    return inst;
}
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

hash table 的 hash 冲突
```

62. NotificationCenter 的底层是怎么实现的?
```

```

63. 消息转发的步骤
```
1. 消息发送阶段
objc_msgSend(receiver, selector)
通过 isa 找到 class, 
CacheLookup 查找 cache
MethodTableLookup -> lookUpImpOrForward, 查找函数表
找父类的 cache, 找父类的 method 表, 找到后缓存到当前类(子类)
如果没有找到 IMP, 尝试动态消息处理, _class_resolveMethod(cls, sel, inst);

消息转发阶段: 
1. 动态方法解析
_class_resolveMethod会向对象发送 +resolveInstanceMethod（实例对象）或 +resolveClassMethod（类对象）方法
2. 重定向接收者
- (id)forwardingTargetForSelector:(SEL)aSelector // 选择备援接收者重新发送消息
methodSignatureForSelector // 抛出 doesNotRecognizeSelector 异常
forwardInvocation // 消息无法处理
3. 最后进行转发
//必须重写这个方法，消息转发使用这个方法获得的信息创建NSInvocation对象。
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
//这一步是最后机会将消息转发给其它对象，对象会将未处理的消息相关的selector，target和参数都封装在anInvocation中。forwardInvocation:像未知消息分发中心，将未知消息转发给其它对象。注意的是forwardInvocation:方法只有在消息接收对象无法正常响应消息时才被调用。
- (void)forwardInvocation:(NSInvocation *)anInvocation

```

64. 如何 debug crash
```
1. 分析 crash 栈最终的异常的类型, 知道这个 crash 的触发范围
2. 根据栈信息回溯, 找到出问题的代码范围, 定位 crash 场景
3. 复现 crash 场景, 构造数据结构, 或者写测试 demo
4. 修复 crash
5. 测试, 看问题的场景是否还会 crash
```

65. http 和 https 的区别? https 请求的流程?
```
1. https 是在 http 基础上增加了 ssl 层
2. https 流程
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

75. swift protocol 如何实现 optional
```
两种方式
```

76. runloop 有几种状态
```

```

77. NSCache

78. 自己设计一个缓存器

79. SDWebImage

80. 二叉树先序遍历(递归和非递归)
```
递归
recourse

非递归
while + stack
```

81. 怎么实现LRU
```
hash map + 双向链表
```

82. MVC 的一些缺点

83. 讲一讲其他架构

84. 你知道哪些编码方式
```
字符集: ASCII, GBK, Unicode
编码方式: UTF-8(是Unicode的一种编码方式), GBK2312
Base64
```

85. 多线程的方式和他们的区别

86. 队列和线程的关系

87. 有哪些锁

88. 属性的关键词

89. assign 可以用于 OC 对象吗
```
可以, 和 unsafe_unretain 相同,不会增加被引用对象的引用计数,当被引用对象释放后,不会被置为 nil, 可能出现野指针的问题.
```

90. copy 和 strong 的区别


91. weak 如何实现自动赋 nil
```
weak 表
```

92. 为什么不可变对象要用 copy
```
strong 的隐患: immutable 指针可以指向子类,可能被赋值一个 mutable 的对象, 如果子类是可以修改的, 不是我们期望的情况. 而使用 copy 即使赋值对象是 mutable 类型,可以获取一个 immutable 的对象.
```

93. Pod update 和 Pod install 的区别
```
update: pod repo update, 同时没有写版本的库, 会升级到最新 ?? 中版本??
install: 直接按照 podfile.lock 文件中的版本安装库
```

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
不会, 浅拷贝只会指针copy, 深拷贝也只是不完全深拷贝

104. 数组的浅拷贝与深拷贝
immutable -> immutable 是浅拷贝
深拷贝
immutable -> mutable
mutable -> immutable
mutable -> mutable

105. TCP为什么是三次握手和四次挥手

106. 你平时怎么解决网络请求的依赖关系：当一个接口的请求需要依赖于另一个网络请求的结果
办法2：逻辑：在上一个网络请求的响应回调中进行下一网络请求的激活
办法3：信号量
办法4：group, block enter, 

107. 关于RAC你有怎样运用到解决不同API依赖关系
```
RAC: Reactive Cocoa
信号的依赖：使用场景是当信号A执行完才会执行信号B,和请求的依赖很类似,例如请求A请求完毕才执行请求B,我们需要注意信号A必须要执行发送完成信号,否则信号B无法执行
```

108. 编译链接你有了解多少
[Objective-C源文件编译过程](https://www.jianshu.com/p/94c2a7a311d4)
编译
step1: 预处理
step2: 编译： 词法分析-语法分析-语义分析-生成中间代码 ir（ll，memory，bitcode格式）
step3: 优化 IR
链接
链接器把编译产生的.o文件和（dylib,a,tbd）文件，生成一个mach-o文件。


109. 简单介绍下KVO的用法
原理：创建子类重载 setter
```
-[obj addObserver:forKeyPath:options:context:]

- observeValueForKeyPath:ofObject:change:context:
```



110. 你认为自动布局怎么实现的
解析：先提到系统提供的 NSLayoutConstraint，再介绍 Masonry怎样基于它的封装？

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

* 子类调用父类的方法, 会缓存在父类还是缓存在子类?
子类缓存

```
参考: 
[深入理解 Objective-C :方法缓存](https://tech.meituan.com/2015/08/12/deep-understanding-object-c-of-method-caching.html)
[iOS 底层拾遗：objc_msgSend 与方法缓存](https://mp.weixin.qq.com/s/NVz_7ZzBrJrOLScmAIU8MA)


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
1. weak table 是个全局 hash table, key 为被引用对象指针地址, value 为数组, 存储弱引用指针
2. 
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

123. @strongify 和 @weakify 两个宏


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
1. gcd
dispatch_block_cancel & dispatch_block_create
dispatch_group_leave ??

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

129. category 为什么 property 不能生成 ivar
```
class 的内存布局在编译期就决定了, ivarlist 的 size 是固定的, 所以不能修改.
那为什么 methodlist 可以修改?
methodlist 是 数组指针 类型, 可以修改指向的数组来改变 methodlist.
cache 和 methodlist 不同, cache 中 bucket 是封装在结构体中, 但原理是相同的.
```

130. 排序算法
```
- 稳定排序算法:
冒泡排序（Bubble Sort） — O(n²)
插入排序（Insertion Sort）— O(n²)
桶排序（Bucket Sort）— O(n); 需要 O(k) 额外空间
计数排序 (Counting Sort) — O(n+k); 需要 O(n+k) 额外空间
合并排序（Merge Sort）— O(nlogn); 需要 O(n) 额外空间
二叉排序树排序 （Binary tree sort） — O(n log n) 期望时间; O(n²)最坏时间; 需要 O(n) 额外空间
基数排序（Radix sort）— O(n·k); 需要 O(n) 额外空间

- 常见的不稳定排序算法有:
选择排序（Selection Sort）— O(n²)
希尔排序（Shell Sort）— O(nlogn)
堆排序（Heapsort）— O(nlogn)
快速排序（Quicksort）— O(nlogn) 期望时间, O(n²) 最坏情况; 对于大的、乱数串行一般相信是最快的已知排序

下列什么排序算法是稳定的
A.归并排序
B.堆排序
C.冒泡排序
D.快速排序
```

131. 给一个类添加方法的途径
```
1. category
2. class_addMethod


子类?
消息转发?
```

132. 图片有两种无损压缩算法, 一个压缩到 10k, 一个压缩到 100k, 两种的内存占用会是怎样的?

132. 横竖屏切换时, 布局的处理

133. id<NSObject> 的含义
id<NSObject>是指针，它要求它指向的类型要实现NSObject protocol

134. 所有的类都继承自 NSObject
NSProxy 不是继承自 NSObject, 但符合 NSObject 协议

135. http 网络优化
[iOS网络模块优化（失败重发、缓存请求有网发送）](https://www.cnblogs.com/ziyi--caolu/p/8176331.html)
```
1. NSURLCache, Last-Modified、ETag //做缓存,保证资源修改后能拉去新的内容
2. 数据压缩: protobuf, WebP
3. 弱网：2G、3G、4G、wifi下设置不同的超时时间
4. 失败重发、缓存请求有网发送
5. DNS 优化,默认映射IP作为配置文件存到包里, HttpDNS:使用指定 dns 服务器获取 IP
6. 大文件分块下载
```

136. 为什么 http 网络请求无法充分利用带宽
[为什么多线程下载能加速？](https://www.zhihu.com/question/19914902/answer/33647099)
```
TCP 拥塞控制不精准
直接原因是 window size 不够大。然而根本原因其实并非 delay ，“时分复用”系统的类比也不大对，应该是 TCP congestion control 导致的。
然而实际情况并非如此。一个网络中并不仅仅有你这么一个连接，单说两个端点处都肯定是如此，更不用说中间大家共用的网络线路了。这种情况下， TCP 的 congestion control 机制就会起作用，通过调节 window size 来避免出现拥塞，因为一旦出现阻塞丢包对整个网络和自身都是很不好的。一般来说最终 window size 无法达到上面说的“理想值”，从而使得传输需要停下来等 ACK ，带宽也就不能被“充分利用”。
...
```

137. 收集 crash

138. 类簇

139. 图片三级缓存
安卓上的概念: RAM,ROM,HTTP

140. Block是对象吗？ weak 为什么能解决循环引用的问题？block在调用前为什么要判空?
block 是对象，继承于 NSBlock
weak 生成弱引用，不增加引用计数
block 调用不是通过消息，而是直接通过地址偏移取函数地址，nil时会出现野指针，导致crash

141. 视频的m3u8是什么

142. app中包含autoreleasepool的个数？1个？2个？有限个？还是无限个？


143. kvo和kvc的使用。iVar和property的区别
```
property = ivar + getter + setter
kvc: 
应用场景: 字典转对象，访问私有变量（iOS13开始禁止）
- `setValue:forKey:` 
调用链: setter - _propertyName - propertyName - 调用 setValue:forUndefinedKey:(默认实现是抛NSUnknownKeyException异常)
- `valueForKey:`
调用链: getter - _name - name - 调用 valueForKey(默认实现是抛出NSUnknownKeyException)
```

144. CoreText原理

145. iOS实现图文混排

146. 远程推送原理理解

147. MVP

148. 输入是两个UIView，输出这两个View的最近的共同superView
- （UIView *)findCommonSuperView:(UIView *)view otherView:(UIView *)otherView {
    NSMutableSet *superViews = [NSMutableSet new];
    UIView *v = view;
    while(v.superView) {
        [superViews addObject:v];
        v = v.superView;
    }
    v = otherView;
    while(v.superView) {
        if([superViews contains:v]) {
            return v;
        }   
        v = v.superView;     
    }
    return nil;
}

149. 操作系统的内存管理方式和调度方式,GCD会对应到操作系统里的哪个东西,


150. GET跟POST的区别,数据链路层和网络层的作用是什么


151. iOS 如何把 UI 组建渲染到屏幕


152. method_swizzling 真实的应用场景

153. student 继承自 person，student 类中 [self class] 和 [super class] 的结果是什么？为什么？
都是 student，
[self class] 会编译成 msgSend() 函数，第一个参数为self，selector(class) 默认实现为 object_getClass(self)
[super class] 会编译成 msgSendSuper() 函数，第一个参数仍为 self，即 student 的实例对象，msgSendSuper 会去 person 中查找 sel，没有找到会去 super 找，知道 NSObject 的默认实现，object_getClass(self) 函数获取到的为 student



## 2.数据库
1. 数据库索引
[数据库索引到底是什么，是怎样工作的？](https://blog.csdn.net/weiliangliang111/article/details/51333169)
一个索引是存储的表中一个特定列的值数据结构（最常见的是B-Tree）。索引是在表的列上创建。所以，要记住的关键点是索引包含一个表中列的值，并且这些值存储在一个数据结构中。

2. 为什么用fmdb

3. 数据库读写安全如何保证

4. 写入一万条数据,如何优化
```
1.合并 sql 语句，一次插入多条（一条sql语句长度有限制，为了防止超过限制，需要控制合并的条数）
2.多条 sql 放到同一个事务中，（事务需要控制大小）
    - 减少 sql 解析、开始、结束带来的不必要的消耗，
    - insert 操作在 MySQL 内部会建立一个事务，事务内指向真正的插入操作，通过事务可以减少创建事务的消耗
3.优化：主键按顺序会加快写入速度，无序的记录会增加索引的成本

https://blog.csdn.net/qq_22855325/article/details/76087138
https://blog.csdn.net/SoulOfAndroid/article/details/42061223
```



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
14. [细说GCD（Grand Central Dispatch）如何用](https://github.com/ming1016/study/wiki/%E7%BB%86%E8%AF%B4GCD%EF%BC%88Grand-Central-Dispatch%EF%BC%89%E5%A6%82%E4%BD%95%E7%94%A8)
15. [iOS Masonry学习和探究](https://www.jianshu.com/p/f7e349bfffd5LIUshuaiLP)
16. [神经病院 Objective-C Runtime 住院第二天——消息发送与转发](https://halfrost.com/objc_runtime_objc_msgsend/#1)
17. [Objc Runtime 总结](https://ming1016.github.io/2015/04/01/objc-runtime/)
18. [当别人问Category为什么不能添加属性](https://www.jianshu.com/p/eebc2acd7da0)
19. [Blocks Programming Topics](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Blocks/Articles/00_Introduction.html)
20. [从 Block 谈堆栈](https://joakimliu.github.io/2018/03/18/Block-heap-stack/)
21. [iOS多线程：『NSOperation、NSOperationQueue』详尽总结](https://juejin.im/post/5a9e57af6fb9a028df222555)
22. [iOS RunTime之二：类结构](https://juejin.im/post/5d6917dd5188257b2a6b2b22#heading-0)
23. [iOS底层原理总结 - 探寻OC对象的本质](https://juejin.im/post/5ac81c75518825556534c0af)
24. [iOS开发·runtime原理与实践: 消息转发篇(Message Forwarding)](https://juejin.im/post/5ae96e8c6fb9a07ac85a3860)
25. [温故知新SEL/MethodSignature/Invocation](https://www.jianshu.com/p/49151a79ac6a)
26. [从 Auto Layout 的布局算法谈性能](https://draveness.me/layout-performance)
27. [iOS中流(Stream)的使用](http://southpeak.github.io/2014/07/17/ioszhong-liu-stream-de-shi-yong/)
28. [Block hook 正确姿势？](https://juejin.im/post/5c653921e51d457fa676eafc)
29. [runtime动态创建类、添加方法、添加实例变量](https://www.jianshu.com/p/c769f64c1357)
30. [https运行原理解析笔记](https://coolcao.com/2018/08/06/https/)
31. [史上最详细的iOS之事件的传递和响应机制-原理篇](https://www.jianshu.com/p/2e074db792ba)
32. [iOS图像最佳实践总结](https://juejin.im/post/5c84bd676fb9a049e702ecd8#heading-10)
33. [iOS底层原理总结 - 探寻OC对象的本质](https://juejin.im/post/5ac81c75518825556534c0af)
34. [优化SQLite3数据库插入10000条数据](https://blog.csdn.net/SoulOfAndroid/article/details/42061223)
35. [数据库大批量SQL插入性能优化](https://blog.csdn.net/qq_22855325/article/details/76087138)
