# ios keychain 开发

## 概念
### keychain
- 作用
iOS开发中用到keychain主要用来保存一些比较私密的且无法保存到服务器的数据。

- 特性
keychain是存在于系统级别的，相对于app是一个相对独立的存储空间，app的更新迭代，删除，系统升级等，都不会影响keychain数据中的保存（系统恢复出厂设置等，恢复型操作除外），所以，keychain在开发中经常被用来存储用户的密码、证书、设备码。
由于apple不允许开发者获取设备的UDID 和 IMEI 号，而开发中经常会遇到需要标示设备的需求，所以keychain存储就显的尤为重要。我们在开发中可以获取到apple提供的UUID，这样我们就可以将这个随机生成的UUID存储到keychain中，间接达到设备码的效果。（恢复出厂设置等操作后。设备码会更新）

- 使用
存储凭证：
1. 创建一个 keychain 条目，设置一组公开的可见属性（attributes）来控制、查询这个条目。
2. keychain service 是一个存储在本地磁盘的数据库，负责处理数据的加密和存储。
认证凭证：
1. 使用 keychain service 和 attributes 来获取解密后的数据

- 优势
	- keychain中的数据不会随 app 卸载/重装而被抹除丢失
	- 可以在 group 中的多个 app 共享
	- 相对于NSUserDefaults、plist文件保存等一般方式，keychain保存更为安全
- 存储
	- 使用 SQLite 存储，存储时会加密，可以使用 iCloud 进行同步
	- 钥匙串使用 AES 256加密算法,能够保证用户密码的安全.
	- （1）未对应用APP的entitlement（授权）进行配置时，APP使用钥匙串存储时，会默认存储在自身BundleID的条目下。
	- （2）对APP的entitlement（授权）进行配置后，说明APP有了对某个条目的访问权限。 

### service
### group

### 类型
- kSecClassGenericPassword
- kSecClassInternetPassword
- kSecClassCertificate
- kSecClassKey
- kSecClassIdentity

### API 组件


## 使用
### SAMKeychain


