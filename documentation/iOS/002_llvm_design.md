# LLVM Design
some of the design decisions that shaped LLVM

前言
LLVM 最开始设计为一组具有良好定义的接口的可重用库，当时开源编译器被设计成专用工具，通常包含巨大的可执行文件。这使得当你想用 parser 去做静态分析或重构，变得非常困难。虽然脚本语言通常有嵌入在大型程序中的解释器或runtime，但 runtime 执行或引入的代码是一个大的代码块，很难做到片段的复用，而跨语言的复用，则更少。

## 经典编译器设计
+----------+-----------+---------+
| frontend | optimizer | backend |
+----------+-----------+---------+

optimizer 为了提高代码执行速度，会负责各种优化，例如减少冗余的计算，同时或多或少依赖语言或者 target。 back end （code generator）将代码应映射成 target 的命令集。除了负责生成 correct code，也利用不同架构的特殊优点特性，生成 good code。后端通用部分包括 instruction selection, register allocation, and instruction scheduling。

11.1.1 支持多语言、多平台的编译器架构
+-----------------+                                +---------------+
|C Frontend       | ----+                    +---> |X86 Backend    |
+-----------------+     |                    |     +---------------+
+-----------------+     |     +---------+    |     +---------------+
|Fortran Frontend | --------> |Common   | -------> |PowerPC Backend|
+-----------------+     |     |Optimizer|    |     +---------------+
+-----------------+     |     +---------+    |     +---------------+
|Ada Frontend     | ----+                    +---> |ARM Backend    |
+-----------------+                                +---------------+

这种架构下，当编译器需要支持一个新的语言时，只需要实现一个新的前端，Optimizer 和 backend 均可复用。 如果每个语言和后端的实现都是独立的，那么支持 N 个语言和 M 个 target，需要 MxN 个编译器。
相比于支持一种语言一种target的编译器，编译器的三相（three-phase）设计能服务于更多的程序。对于一个开源项目，这意味着会有更多潜在的贡献者来优化、提高这个编译器。而 proprietary compilers 的质量，完全取决于预算。

三相编译器降低了开发需要的技术门槛，只需要了解前端或后段，即可进行开发，而不需要同时掌握前后端开发技术，这也使得三相编译器取得最终胜利。




### reference
1 [llvm design](http://www.aosabook.org/en/llvm.html)
