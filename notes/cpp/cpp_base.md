
0. STL
Standard Template Library, 标准模版看, Cpp 软件库.
四部分: 容器,算法,函数,迭代器
容器: 
- 序列容器(sequence containers)
    - vector(动态数组)
    - list(有序容器,双向链表,速度比vector慢)
    - forward_list(list的单链表版本)
    - deque(双端队列)
    - array
- 关联容器(associative containers))
    - set(不可重复集合)
    - multiset(与set功能相同,但允许重复元素)
    - map(关联数组,每个元素含有两个数据项, map将一个数据项映射到另一个数据项中)
    - multimap(跟map具有相同功能，但允许重复的键值)

    - unordered_set
    - unordered_map
    - unordered_multiset
    - unordered_multimap	分别类似于集合、多重集合、映射、多重映射，但使用哈希表实现。它的键（Keys）没有排序（operator<），相反必须存在一个从键类型到size_t的哈希函数、且要求键之间可以判等（operator==）。自C++11起进入语言标准。
    

1. vector
动态数组, 可以动态添加删除元素, 所有元素必须是相同类型
```
// syntax
#include <vector>
vector<int> vec = {1, 2, 3};
vector<int> vec(10);

vec.size() // 当前 vector 元素个数, 可能和 capacity 不同
vec.capacity() // 当前 vector 使用的空间的数量, >= size, 多数情况不需要关系 capacity

- 访问元素的方法
    vec[i] - 访问索引值为 i 的元素引用。 (索引值从零起算，故第一个元素是vec[0]。)
    vec.at(i) - 访问索引值为 i 的元素的引用，以 at() 访问会做数组边界检查，如果访问越界将会抛出一个例外，这是与operator[]的唯一差异。
    vec.front() - 回传 vector 第一个元素的引用。
    vec.back() - 回传 vector 最尾端元素的引用。
- 新增或移除元素的方法
    vec.push_back() - 新增元素至 vector 的尾端，必要时会进行存储器配置。
    vec.pop_back() - 删除 vector 最尾端的元素。
    vec.insert() - 插入一个或多个元素至 vector 内的任意位置。
    vec.erase() - 删除 vector 中一个或多个元素。
    vec.clear() - 清空所有元素。
- 获取长度/容量
    vec.size() - 获取 vector 当前持有的元素个数。
    vec.empty() - 如果 vector 内部为空，则传回 true 值。
    vec.capacity() - 获取 vector 当前可容纳的最大元素个数。这个方法与存储器的配置有关，它通常只会增加，不会因为元素被删减而随之减少。
- 重新配置／重置长度
    vec.reserve() - 如有必要，可改变 vector 的容量大小（配置更多的存储器）。在众多的 STL 实例，容量只能增加，不可以减少。
    vec.resize() - 改变 vector 当前持有的元素个数。
- 迭代 (Iterator)
    vec.begin() - 回传一个Iterator，它指向 vector 第一个元素。
    vec.end() - 回传一个Iterator，它指向 vector 最尾端元素的下一个位置（请注意：它不是最末元素）。
    vec.rbegin() - 回传一个反向Iterator，它指向 vector 最尾端元素的。
    vec.rend() - 回传一个Iterator，它指向 vector 的第一个元素的前一个位置。
```

2. string


3. dictionary


4. system
直接运行 shell 命令
```
system("pause");
```

