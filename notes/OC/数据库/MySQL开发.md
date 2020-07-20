## 1. MySQL


## 2. 开发基础
- SQL
    - create db
    - create table
    - insert data
```
let insertStatementString = "INSERT INTO Contact (Id, Name) VALUES (?, ?);"
# 语句中的问号？是表明编译时不提供数据，当运行时才提供数据，这样可以提前编译语句，并且可以对编译后的语句进行复用，插入不同数据。

func insert() {
  var insertStatement: OpaquePointer?
  // 1
  if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == 
      SQLITE_OK {
    let id: Int32 = 1
    let name: NSString = "Ray"
    // 2
    sqlite3_bind_int(insertStatement, 1, id)
    // 3
    sqlite3_bind_text(insertStatement, 2, name.utf8String, -1, nil)
    // 4
    if sqlite3_step(insertStatement) == SQLITE_DONE {
      print("\nSuccessfully inserted row.")
    } else {
      print("\nCould not insert row.")
    }
  } else {
    print("\nINSERT statement is not prepared.")
  }
  // 5
  sqlite3_finalize(insertStatement)
}

// 2 sqlite3_bind_int() 来绑定问号❓和值
```

- DataBase


- FileManager


## 3. 开发

### 函数
很多 SQLite 函数返回 Int32 类型的结果 code，例如 SQLITE_OK, SQLITE_DONE


- sqlite3_open(dbPath: String, &db: OpaquePointer?)

打开或者创建一个数据库

- sqlite3_prepare_v2()

将字符串 sql 语句编译成二进制代码，并返回一个状态码

- sqlite3_step()

run 编译好的 sql 语句

- sqlite3_finalize() 
  
在编译语句后必须调用此函数来删除释放编译好的语句，避免内存泄漏。当一个语句 finalize 后，就不能再次使用。


- sqlite3_reset()

重置语句