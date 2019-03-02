# iOS Tips

## 1 APP 

### 1.1 检查手机是否已安装第三方 app 

```
// info.plist 中增加以下配置，目的是让 app 有权限跳转
	<key>LSApplicationQueriesSchemes</key>
	<array>
		<string>youtube</string>
	</array>

// eg.youtube
if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"youtube://"]]) {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"youtube://"]];
}
```



### 1.2 手势冲突



```

```



### 1.3 view from xib



## 2 NavigationBar

