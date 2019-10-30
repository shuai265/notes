1. Masonry 

是对 NSLayoutConstraint 的封装, 使用函数式编程和链式编程.

```
1.mas_makeConstraints:
		self.translatesAutoresizingMaskIntoConstraints = NO;
    MASConstraintMaker *constraintMaker = [[MASConstraintMaker alloc] initWithView:self];
    block(constraintMaker);
    return [constraintMaker install];


2.constraintMaker: MASConstraintMaker
创建保存约束对象的对象, 传递给 block

3.block(constraintMaker) : void(^)(MASConstraintMaker *) {
		//写约束 
		make.left.top.equalTo(greenView.mas_bottom).offset(padding);
		//1.make: MASConstraintMaker 对象
		//2.make.left: 创建,返回 MASViewConstraint 对象, 保存了约束类型
		top -> MASViewAttribute(old/new) -> self.constraints.add -> return newConstraint
		//3.make.left.top: 创建返回新的 MASCompositeConstraint, 包含 children<MASViewConstraint> 数组
		top -> MASViewAttribute(old/new) -> MASCompositeConstraint(children) -> replace -> return newConstraint
		//4.make.left.top.equalTo()
		
	}
block 使用 constraintMaker 调用传入的代码

4.contraintMaker install
```



2. NSLayoutConstraint
3. 相关问题

- blcok 中调用 self, 会造成循环引用吗?

```
不会, block 没有做 copy 操作, 是 stack 类型,不会造成循环引用.
```



