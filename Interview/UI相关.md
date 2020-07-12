1. 两个label在同一行，A左对齐，B右对齐，A宽度优先级比B高，如何实现？
固有约束（intinsic content size）
固有约束分为两种：
1) Content Hugging Priority
官方文档的解释是
Returns the priority with which a view resists being made larger than its intrinsic size.
即表示的是控件的抗拉伸优先级，优先级越高，越不易被拉伸，默认为251

2)Content Compression Resistance Priority
Returns the priority with which a view resists being made smaller than its intrinsic size.
这个优先级的字面意思很明确了，是防压缩优先级，优先级越高，越不易被压缩，默认为750


2. 离屏渲染
```
对性能影响排名
shadow，cornerRadius，mask这招，allowsGroupOpacity，edge antialiasing，shouldRasterze， coreGraphics
```


3. 异步渲染
CALayer 提供了异步渲染的入口


4. AutoLayout 底层如何实现的
公式&要素 7个
公式: view1.attr1 = view2.attr2 * multiplier + constant
原理:
组织: 最顶层的视图一定是有具体的坐标信息, 内部的子控件布局时读取对应的约束, 例如 距父视图上偏移100pt, 就会被转化为 frame.orginal.y = 100; 最终形成GPU可以读取的坐标信息, 并且, 在存在多个控件的情况下, 所有的约束会被分解成 链状+树状 进行组织, 根视图就是拥有具体坐标信息的最顶层父视图, 下面的同等级控件以及更下级控件的排列顺序, 应该是按照添加顺序从左至右组织, 形成树组织
转化: 按照以上原理将所有的布局约束转化 树状节点组织, 读取的顺序类似于 BFS 的读取方式,先将横向的同级控件的约束转化为坐标点进行布局, 之后, 在布局深度的子叶节点.
总论: 因为GPU在形成光栅化渲染的时候, 一定是要获取到每个坐标点的颜色值, 因此, 无论是设置控件的 frame 或者是 autolayout, 在渲染之前, 实际上都会被转化为具体的坐标点, 因此, autolayout 相对frame来讲, 在GPU阶段是一样的, 主要的区别在于同样的效果在代码阶段表现是不同的, autolayout 使用了较为贴近自然语言的方式去描述位置信息, 所以在最终阶段, 相对 frame就多了一个转化阶段, 就是将自然语言描述的位置信息转化为具体的坐标信息


5. UIImage
- imageNamed: 如何做缓存
1.用过这种方式加载图片，一旦图片加载到内存中，那么就不会销毁，一直到程序退出, 图片的内存管理并不受程序员控制。（也就是说imageNamed:会有图片缓存的功能，当下次访问图片的时候速度会更快。）
2.创建一个UIImage对象，并不是说image这个本身就是一张图片，而是image指向一张图片。在创建这个对象的时候实际上并没有把真正的图片加载到内存里，而是等到用到图片的时候才会加载
3.如果把image对象设置为nil，如果是其它对象，那么没有强指针指向一个对象，这个对象就会销毁；但是即使image = nil，它会指向的图片资源也不会销毁

- imageWithContentsOfFile:
1.使用这个方法加载图片，当指向图片对象的指针销毁或指向其它对象，这个图片对象没有其它强指针指向，这个图片对象会销毁，不会一直在内存中停留
2.为没有缓存，所以如果相同的图片多次加载，那么也会有多个图片对象来占用内存，而不是用缓存的图片
3.使用这个方法，需要file的全路径（之前用NSString, NSArray之类的加载文件也是一样的，比如stringWithContentsOfFile:，看到file就知道是需要传入全路径。）
4.注意如果图片在Images.xcassets中，是不能使用这个方法的。所以说想要自己进行图片的内存管理（不希望有缓存图片），那么要将图片资源直接拖入工程，而不是放在Images.xcassets中

6. 如何估算一个图片的内存占用


7. 圆角如何实现
```
1.layer.cornerRadius
❌离屏渲染，影响性能
2.layer.mask = CAShapeLayer
❌重载 drawRact, 不能避免离屏渲染
3.CoreGraphics
✅CoreGraphics 截取图片绘制圆角
4.透明图片遮盖
```

8. 时间响应
传递
runloop-application-window-vc-view-subview
hitTest
locate
响应
touchesBegin


9. UIButton 继承链
UIButton > UIControl > UIView > UIResponder > NSObject

10. 手势识别和事件响应
事件首先发给这些手势，然后再发给响应链
事件先传递给手势，如果手势可以处理，则取消响应链
