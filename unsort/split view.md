待整理：



1. md5 算法
2. archpoint
3. iPad supported Orientations

split view

https://developer.apple.com/library/archive/documentation/WindowsViews/Conceptual/AdoptingMultitaskingOniPad/QuickStartForSlideOverAndSplitView.html#//apple_ref/doc/uid/TP40015145-CH13-SW1

>**split view 是什么**
>
>iPad 为支持 app 多开引入的概念，iPad 支持同时打开两个支持 split view 的 app。这两个app 可以同时在前台运行，但区分主次 app，主次app的主要区别：
>
>- 主app控制状态栏
>- 主app有资格使用第二个物理屏幕
>- 主app可以参与画中画自动调用
>- 横屏时主app可以占据三分之二的屏幕，在 iPad 和 iPad mini 上 可以获得常规的 size class
>
>**开启条件**
>
>XCode7 iOS9 引入 Slide Over 和 Split View ，如果满足开启条件则默认开启。开启条件：Info.plist 文件中 "supported interface orientations(iPad)" 数组中包含全部四个方向，即设置 iPad 支持四个方向，同时 UIRequiresFullScreen 为 YES。
>
>**怎么用**
>
>- 开启
>- 适配屏幕，适配分屏状态布局
>
>**影响**
>
>支持split view属性后，系统将忽略下面两处代码：
>
>- `UIApplicationDelegate`中的`supportedInterfaceOrientationsForWindow:`方法
>- `UIViewController`通过`supportedInterfaceOrientations`方法设置的自己支持的屏幕方向
>
>以及`UIViewController`中`shouldAutorotate`的值。
>
>**如何关闭**
>
>- “Supported interface orientations (iPad)”属性对应的值未包含四个方向
>- “UIRequiresFullScreen”对应的值为`NO`
>
>关闭后屏幕方向控制与 iPhone 相同
>
>



## 屏幕旋转

相关函数

```
# UIApplicationDelegate
# 向 delegate 询问指定 window 中的 view controller 支持的方向
optional func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask

```





```
# UIViewController
# 返回 view controller 支持的方向
var supportedInterfaceOrientations: UIInterfaceOrientationMask { get }

# 返回布尔值来表明 view controller 是否自动旋转
var shouldAutorotate: Bool { get }
```



> size class
>
> 