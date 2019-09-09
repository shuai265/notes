### xcode 中概念

https://developer.apple.com/library/archive/featuredarticles/XcodeConcepts/Concept-Build_Settings.html#//apple_ref/doc/uid/TP40009328-CH6-SW1

#### **Xcode Project**

[链接](https://developer.apple.com/library/archive/featuredarticles/XcodeConcepts/Concept-Projects.html#//apple_ref/doc/uid/TP40009328-CH5-SW1)

一个 Xcode Project 是 build (构建) 一个或多个 software products 需要用到的文件、资源文件、信息等内容的容器. 一个 project 包含 product 需要的所有元素和元素之间的关系. 

包含一个或多个 target, 每个 target 包含了如何 build product 的信息. 

一个 project 包含所有 target 的默认 build settings, 同时每个 target 拥有自己的 build settings, 会覆盖默认 build settings.

具体内容:

- 文件的引用
- 导航结构
- Project-level build config:例如 debug/release
- Targets, 每个 target 包含
  - 一个 product
  - product 引用的文件
  - build product 的 settings 和 config
- ​	可执行环境(executable environments), 用来 test, debug 程序, 每个可执行环境包含:
  - Xcode 中可执行的内容
  - 命令行参数
  - 环境变量



project包含1个或者多个target, 每1个target对应1个product，使用xcode创建1个工程，默认会创建3个target,假设工程名为CardPlayer，会有如下Target:CardPlayer,CardPlayerTests，CardPlayerUITests，这3个Target每1个都有对应的文件系统目录:

```
.
├── CardPlayer
├── CardPlayer.xcodeproj
├── CardPlayerTests
├── CardPlayerUITests

```



.xcodeproj 工程文件, 是个文件夹, 包含所有配置信息, 结构如下

```
CardPlayer.xcodeproj/
├── project.pbxproj
├── project.xcworkspace
│   └── contents.xcworkspacedata
└── xcshareddata
    └── xcschemes
        └── CardPlayer.xcscheme
```







#### **Xcode Workspace**

workspace 是一个 Xcode 文本, 其中包含了一组 project, 对 project 和 target 之间提供了 implicit(含蓄) and explicit(明确) relationships

默认情况下, workspace 中的所有 project 共享 build 目录.



#### **Scheme**

Scheme 中定义了需要 build 的 target, 同时包含了 build 过程中的配置、test、环境变量等内容.

结构: Xcode build - Scheme - Target

```
我们可以使用Xcode的Schemes来指定当用户选择菜单栏Product目录下的Build, Test, Run, Profile, Anaylyze等指令执行时，

工程配置的哪个target，哪个build configuration和哪个executable configuration是激活的。

所以当用户执行Product -> Build时，会按照scheme里对Build的配置去执行，或者说Product -> Test时，会按照scheme里对Test的配置去执行

在管理scheme时，如果将某个scheme设置为共享，会产生xcshareddata/xcschemes/CardPlayer.xcscheme文件，这个文件管理scheme信息

如果没有将scheme设置为共享，不会产生CardPalyer.xcsheme文件，如果提交到git仓库，其他人将仓库代码拉下来后，将不会有scheme配置，如果使用命令行构建将会失败

创建1个工程默认会创建1个和工程名同名的scheme，如果使用cocopod创建workspace，会有2个工程，1个是我们应用的主工程，1个是Pod工程，主工程有1个sheme，Pod工程会有多个scheme，其中1个是Pod scheme，另外每个依赖的库都有1个对应的scheme
```



#### **Build Settings**

build setting 是一个变量, 它包含了编译期间各个组成部分的信息, 指明如何编译. 例如包含 Xcode 传给编译器的参数.

build setting 有 project level 和 target level,  project-level 会应用在所有 target 上, target 可以设置自己的 setting 并且覆盖 project-setting.

每个 target 管理着构建 product 所需要的文件, 一个 build configuration 特指构建 target 的 product 的一组设置/配置. 例如构建 debug 和 release 版本的产品, 需要分别设置对应的 build configuration.

Xcode 中一个 build setting 包含两部分: `the setting title` 和 `the definition`,  `the setting title ` 指明编译设置项, `the definition` 则是一个常量或者 formula(惯用语/公式) , Xcode 根据这个值来确定编译期的参数. 另外一个 build setting 可能还会有一个用在 Xcode 设置中的展示名(display name)

当从 project 模版创建新 project 时, Xcode 会默认生成一份 build setting, 



#### **Target**

```
1个target指定了要构建的product，并且包含了从工程源文件构建product的指令。 1个target定义了单个product，它将输入组织成构建系统，包含源文件和构建product的指令。1个project可以有1个或者多个target，每个Target都可以输出1个product

构建产品的指令 在工程的 build settings 和 build phases进行设置，可以通过Xcode project editor进行检查和编辑。 target的构建指令的配置是从project的构建配置继承下来的，但是可以在xcode project editor编辑工程配置时，在target级别对构建指令进行配置。任何时候都只有1个激活的target, Xcode的scheme指定了那个激活的Target

1个target和它创建的product可以和其它target关联。 如果1个target需要依赖于其它target的输出来构建的话，则说第1个target依赖于第2个target。如果targets在同1个workspace，Xcode可以自动发现这些依赖，在这种情况下，构建时会按照需要的顺序来构建。我们说这种关系是隐式依赖。我们也可以在build phase里显示指定target的依赖关系，也可以让本以为有隐式依赖但实际没有依赖的两个target有显示依赖关系。例如，我们有可能会在同1个workspace里有1个Library，也有1个依赖于该libary的应用，Xcode可以发现这种关系，并且自动先构建Library。但是如果你真是想链接的是另1个版本的库，而不是workspace里的库，你可以创建1个在build phrase里创建显示依赖关系，这会覆盖隐式依赖
```





### Ref

http://www.cloudchou.com/android/post-989.html



