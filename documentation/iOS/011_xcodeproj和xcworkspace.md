iOS xcodeproject 和 xcworkspace 

## 1.xcodeproj

### 1.目录结构

```
project.pbxproj
xcshareddata - xcschemes - xxx.xcscheme # .xcscheme 文件
xcuserdata - username.xcuserdated - xcschemes - xcschememanagement.plist #一些
```



#### project.pbxproj

```
1.本质上是一种旧风格的 Property List 文件, Property List 在苹果家族的历史上存在三种格式：OpenStep，XML 和 Binary

```

#### .xcscheme

```
1.本质是 xml 格式的文件, 保存了 scheme 的信息
2.主要节点
BuildAction --- 
TestAction ---
LaunchAction ---
ProfileAction ---
AnalyzeAction ---
ArchiveAction ---

3.重要参数
BuildableName 
BlueprintName 对应 target 的名称
ReferencedContainer 对应的 xcodeproj 文件
```

