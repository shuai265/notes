1. modalPresentationStyle
不设置 modalPresentationStyle 在 iOS13 上 present vc 时会出现非全屏的样式, 可以直接拖动关闭.

2. StoreKit
- New Apple URL schemes for apps.apple.com, books.apple.com, and music.apple.com are now parsed for SKStoreProductViewController.
- Present SKStoreProductViewController only in portrait mode, so that we can prevent a SKStoreProductViewController crash in landscape mode (as designed by Apple).

3. 使用 @available 导致旧版本 Xcode 编译出错
使用 Xcode11 打包时, 发现向静态库文件中插入了 isPlatformVersionAtLeast, 导致 sdk 在 Xcode10 中无法编译.

```
在 Xcode 11 的 SDK 工程的代码里面使用了 @available 判断当前系统版本，打出来的包放在 Xcode 10 中编译，会出现一下错误：
Undefine symbols for architecture i386:
    "__isPlatformVersionAtLeast", referenced from:
        ...
ld: symbol(s) not found for architecture i386

复制代码从错误信息来看，是 __isPlatformVersionAtLeast 方法没有具体的实现，但是工程里根本没有这个方法。实际测试无论在哪里使用@available ，并使用 Xcode 11 打包成动态库或静态库，把打包的库添加到 Xcode 10 中编译都会出现这个错误，因此可以判断是 iOS 13 的 @available 的实现中使用了新的 api。
```

解决方案
```
if ([UIDevice currentDevice].systemVersion.floatValue >= 13.0) {
    ...
}
```


4. Sign in with Apple
苹果更新了审核规则以后要求所有使用第三方登录的应用必须向用户提供以苹果账号登录的选项, 并且要放前边

5. KVC 限制
*** Terminating app due to uncaught exception 'NSGenericException',  reason: 'Access to xxx's _xxx ivar is prohibited. This is an application bug'

6. 废弃UIWebview APIs
在 iOS 13 推出后，苹果在 UIWebView 的说明上将其支持的系统范围定格在了 iOS 2 ~ iOS 12。目前，如果开发者将包含 UIWebView api 的应用更新上传到 App Store 审核后，其将会收到包含 ITMS-90809 信息的回复邮件，提示你在下一次提交时将应用中 UIWebView 的 api 移除。


7. DeviceToken 获取
DeviceToken 获取到的格式发生变化, 使用第三方推送受到影响, 例如 [友盟](https://developer.umeng.com/docs/66632/detail/126489)

```
#include <arpa/inet.h>
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    if (![deviceToken isKindOfClass:[NSData class]]) return;
    const unsigned *tokenBytes = [deviceToken bytes];
    NSString *hexToken = [NSString stringWithFormat:@"%08x%08x%08x%08x%08x%08x%08x%08x",
                          ntohl(tokenBytes[0]), ntohl(tokenBytes[1]), ntohl(tokenBytes[2]),
                          ntohl(tokenBytes[3]), ntohl(tokenBytes[4]), ntohl(tokenBytes[5]),
                          ntohl(tokenBytes[6]), ntohl(tokenBytes[7])];
    NSLog(@"deviceToken:%@",hexToken);
}
```

8. LaunchImage 被弃用



9. sceneDelegate
把原本 appDelegate 拆分为 appDelegate 和 sceneDelegate, 分管不同生命周期的回调
https://juejin.im/post/5d8b3ebc518825092202f4ab


