### 使用 Xcode 命令行工具



https://developer.apple.com/library/archive/technotes/tn2339/_index.html



#### Command Line Tools Package

Command Line Tools Package 是一个小型 self-contained 的 package, 和 Xcode 独立, 支持 command line 开发. 由 macOS SDK , command-line tools(例如 Clang) 组成. 

```
安装目录
/Library/Developer/CommandLineTools
```

1  查看版本

```
$ xcode-select --print-path
/Applications/Xcode8.3.3/Xcode.app/Contents/Developer
```

2  切换版本

```
$ sudo xcode-select -switch <path/to/>Xcode.app
```

#### 通过命令行构建 project

xcodebuild 是一个命令行工具, 可以通过命令后对 Xcode project 和 workspace 执行 build, query, analyze, test, archive 等操作. xcodebuild 的操作对象为一个或多个 target 或 scheme. 

3  list all scheme

```
$ xcodebuild -list -workspace MyApplication.xcworkspace
Information about workspace "MyApplication":
    Schemes:
        iOSApp
        tvOSApp
        macOSApp
```

5  打印一个 project 的全部信息

```
$ xcodebuild -list -project MyProject.xcodeproj
```

6 build ( `build`, `analyze`, and `archive`) 一个 scheme 

```
$ xcodebuild -scheme tvOS  build
```

7 用配置文件 build target

```
xcodebuild -target <your_target_name> -xcconfig <your_configuration_file>.xcconfig
```

> [Configuration Settings File (xcconfig) format](https://help.apple.com/xcode/mac/current/#/dev745c5c974)

8 给 debug app 设置 location

```
$ xcodebuild -scheme iOS SYMROOT="/Users/username/Desktop/DebugLocation"
```

9 给 release app 设置 location

```
$ xcodebuild -scheme iOS  DSTROOT="/Users/username/Desktop/ReleaseLocation" archive
```

* Xcode 中可以为 xcodebuild 设置默认的 build configuration

  project -> Info -> "Use  Debug/Release for command-line builds"

#### 同过命令行运行单元测试

```
xcodebuild test [-workspace <your_workspace_name>]
                [-project <your_project_name>]
                -scheme <your_scheme_name>
                -destination <destination-specifier>
                [-only-testing:<test-identifier>]
                [-skip-testing:<test-identifier>]
```

10 Tests the macOS scheme for 64-bit in macOS.

```
xcodebuild test -scheme macOS -destination 'platform=macOS,arch=x86_64'
```

11  Tests the iOS scheme on a device identified by 965058a1c30d845d0dcec81cd6b908650a0d701c.

```
xcodebuild test -workspace MyApplication.xcworkspace -scheme iOSApp -destination 'platform=iOS,id=965058a1c30d845d0dcec81cd6b908650a0d701c'
```

12 在 iPhone 上测试 app scheme

```
$ xcodebuild test -workspace MyApplication.xcworkspace -scheme iOSApp -destination 'platform=iOS,name=iPhone'
```

13 在 iPhone 上跳过 iOSAppUITests

```
xcodebuild test -workspace MyApplication.xcworkspace -scheme iOSApp -destination 'platform=iOS,name=iPhone' -skip-testing:iOSAppUITests
```

14 只运行单元测试中的单个case

```
$ xcodebuild test -workspace MyApplication.xcworkspace -scheme iOSApp -destination 'platform=iOS,name=iPhone' -only-testing:iOSAppTests/SecondTestClass/testExampleB
```

15 指定测试模拟器的机型和系统版本

```
xcodebuild test -scheme iOS -destination 'platform=iOS Simulator,name=iPad Pro (12.9-inch),OS=10.2'
```

16 通过 ID 设置测试模拟器

```
xcodebuild test -scheme tvOS -destination 'platform=tvOS Simulator,id=D6FA2C2A-E297-406A-AA22-624B4834ACB2'
```

17 同时在模拟器和真机上做测试

```
xcodebuild test -scheme iOS -destination 'platform=iOS Simulator,name=iPhone 6s,OS=10.3' -destination 'platform=iOS,name=iPod touch'
```

18 Builds tests and associated targets in the tvOS scheme using the tvOS Simulator identified by D6FA2C2A-E297-406A-AA22-624B4834ACB2.

```
xcodebuild build-for-testing -scheme tvOS -destination 'platform=tvOS Simulator,id=D6FA2C2A-E297-406A-AA22-624B4834ACB2'
```

19 Tests the iOSApp scheme on an iPhone SE with iOS 10.1 in the Simulator.

```
xcodebuild test-without-building -workspace MyApplication.xcworkspace -scheme iOSApp -destination 'platform=iOS Simulator,name=iPhone SE,OS=10.1'
```

20 Testing bundles and other parameters specified in iOSApp_iphonesimulator.xctestrun using the iOS Simulator identified by 6DC4A7BA-EA7F-40D6-A327-A0A9DF82F7F6.

```
$ cat iOSApp_iphonesimulator.xctestrun

$ xcodebuild test-without-building -xctestrun iOSApp_iphonesimulator.xctestrun -destination 'platform=iOS Simulator,id=6DC4A7BA-EA7F-40D6-A327-A0A9DF82F7F6'
```

















