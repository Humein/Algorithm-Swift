# Algorithm-Swift

##    **按照算法方法分类**

[北美算法面试的题目分类，按类型和规律刷题，事半功倍](https://zhuanlan.zhihu.com/p/89392459)

[动态规划及面试，学完这一篇，你就入门了：Dynamic Programming, 动态规划，经典题目](https://zhuanlan.zhihu.com/p/89391817)

##### [labuladong f**k](https://github.com/labuladong/fucking-algorithm)



>   **一般对所要求解的问题的时间复杂度要求比较高的，可以优先考虑如下几种算法。**
>
>   **①分治法**
>
>   **②递归法**
>
>   **③贪心算法**
>
>   **④动态规划算法**

### 动态规划 DP

```
//MARK:- 动态规划    https://juejin.im/post/5dcb8201e51d45210f046f5a#heading-0
/*
 动态规划在查找有很多重叠子问题的情况的最优解时有效。它将问题重新组合成子问题。为了避免多次解决这些子问题，它们的结果都逐渐被计算并被保存，从简单的问题直到整个问题都被解决。因此，动态规划保存递归时的结果，因而不会在解决同样的问题时花费时间。

 动态规划只能应用于有最优子结构的问题。最优子结构的意思是局部最优解能决定全局最优解（对有些问题这个要求并不能完全满足，故有时需要引入一定的近似）。简单地说，问题能够分解成子问题来解决。
 
 适用情况
 最优子结构性质。如果问题的最优解所包含的子问题的解也是最优的，我们就称该问题具有最优子结构性质（即满足最优化原理）。最优子结构性质为动态规划算法解决问题提供了重要线索。
 无后效性。即子问题的解一旦确定，就不再改变，不受在这之后、包含它的更大的问题的求解决策影响。
 子问题重叠性质。子问题重叠性质是指在用递归算法自顶向下对问题进行求解时，每次产生的子问题并不总是新问题，有些子问题会被重复计算多次。动态规划算法正是利用了这种子问题的重叠性质，对每一个子问题只计算一次，然后将其计算结果保存在一个表格中，当再次需要计算已经计算过的子问题时，只是在表格中简单地查看一下结果，从而获得较高的效率。
 */

```



[DP算法](https://www.cnblogs.com/yinyiyu/p/6726185.html)

> [动态规划(DP)的整理-Python描述](https://blog.csdn.net/MrLevo520/article/details/75676160)
>
> > 解决问题
> >
> > 1. **背包问题** 
> >
> > - **主问题的答案 包含了 可分解的子问题答案 （也就是说，问题可以被递归的思想求解**）
> > - **递归求解时， 很多子问题的答案会被多次重复利用**
> >
> > ​     **动态规划的本质思想就是递归， 但如果直接应用递归方法， 子问题的答案会被重复计算产生浪费， 同时递归更加耗费栈内存， 所以通常用一个二维矩阵（表格）来表示不同子问题的答案， 以实现更加高效的求解。**



* [漫画：什么是动态规划？](https://blog.csdn.net/moakun/article/details/79928067)

  [什么是动态规划？动态规划的意义是什么？](https://www.zhihu.com/question/23995189?utm_source=wechat_session&utm_medium=social&utm_oi=43526393954304)

  [322-零钱兑换](https://zhuanlan.zhihu.com/p/61277271)

  [[动态规划入门题之国王和金矿(0-1背包问题)](https://www.cnblogs.com/hczd123/p/7412950.html)](https://www.cnblogs.com/hczd123/p/7412950.html)

*  递归不是动态规划，不能混淆，二者有相通的地方，**递归是自顶向下，动归是自底向上**。动归是递归综合备忘录算法以后的反向思维形式。

 

*   动态规划的设计，其实就是利用**最优子结构和重叠子问题性质对穷举法进行优化**，通过将中间结果保存在数组中，实现**用空间来换取时间交换**，实现程序的快速运行。（动态规划求解时，一般都会转化为网格进行求解，而且因为是空间换时间（避免了子问题的重复计算），因此一般迭代求解）



* 动态规划杀手锏

  **1）建模：**

  * 最优子结构  F(10) = F(9) + F(8 )
  * 状态转移方程   F(n) = F(n-1) + f(n-2)
  * 边界   F(1)   F(2)

  

  **2）实现：**

  递归法

  备忘录法（从上到下，非全二叉树，hash保存！）

  自底而上（迭代实现）

```swift
'最后总结一下DP算法的思路:

'先自顶向下找到规律'，再通过状态转移方程描述这个规律，最后使用'自底向上简化时间复杂度。

核心: '最优子结构、边界条件、状态转移方程 

解题步骤: 1,建立数学模型 2,写代码求解问题 
  '  如何建模?
       先写出所求问题的最优子结构,进而分析出边界和状态转移方程,数学模型即这2者的组合
       对于2输入维度动态规划 画表格帮助分析 行列分别代表1个输入维度

   ' 如何求解?
      建好模后,根据方程组'写出自底向上的动态规划代码',一维输入就是1个for循环,二维输入就是2个for循环,如果方程组比较抽象,
      可以画表格帮助分析
```



### 贪心算法

```
//MARK:-  贪心算法
/*
 贪心算法与动态规划的不同在于它对每个子问题的解决方案都做出选择，不能回退。
 动态规划则会‘保存’以前的运算结果，并根据以前的结果对当前进行选择，有回退功能。
 一旦一个问题可以通过贪心法来解决，那么贪心法一般是解决这个问题的最好办法。由于贪心法的高效性以及其所求得的答案比较接近最优结果，贪心法也可以用作辅助算法或者直接解决一些要求结果不特别精确的问题。
 步骤
 创建数学模型来描述问题。
 把求解的问题分成若干个子问题。
 对每一子问题求解，得到子问题的局部最优解。
 把子问题的解局部最优解合成原来解问题的一个解。
 */


```



* 实现思路：

  1. 从问题的某个初始解出发。
  2. 采用**循环语句**，当可以向求解目标前进一步时，就根据局部最优策略，得到一个部分解，缩小问题的范围或规模。
  3. 将所有部分解综合起来，得到问题的最终解。

  

### 递归

```objective-c
//MARK:- 递归
 递归详解  https://mp.weixin.qq.com/s/mJ_jZZoak7uhItNgnfmZvQ
 步骤
 0. 是否有边界
 1. 定义递归函数功能
 2. 寻找结束条件
 3. 寻找等价关系
    等价条件中，一定是范围不断在缩小，对于链表来说，就是链表的节点个数不断在变小
 
 处理好递归的3个主要的点:
 a) 出口条件，即递归“什么时候结束”，这个通常在递归函数的开始就写好;
 b) 如何由"情况 n" 变化到"情况 n+1/n-1", 也就是非出口情况，也就是一般情况——"正在"递归中的情况；
 c) 初始条件，也就是这个递归调用以什么样的初始条件开始
 
'一个递归一般包含3个点
 1. 边界 一般也是递归结束条件
 2. 递归转移方程
 3. 出/入栈的地方 处理逻辑
 
 

 递归由于是函数调用自身， 而函数调用是有时间和空间的消耗的：每一次函数调用，都需要在内存栈中分配空间以保存参数、返回地址及临时变量，而且往栈里压入数据和弹出数据都需要时间。另外，递归中有可能很多计算都是重复的，从而对性能带来很大的负面影响。除了效率之外，还有可能使调用栈溢出，前面分析中提到需要为每一次函数调用在内存栈中分配空间，而每个进程的栈的容量是有限的。当递归调用的层级太多时，就会超出栈的容量，从而导致调用栈溢出。


```



### 滑动窗口 <3个指针>

* 滑动窗口:是指的是数组/字符串问题的常用抽象概念.窗口通常在数组/字符串中由开始和结束的索引定义的一系列元素的集合.即可[`i,j)(左闭,右开)`.而滑动窗口是可以将2个边界向某一个方向"滑动"的窗口.例如,我们将`[i,j)`向右滑动1个元素,则它将变成`[i+1,j+1)(左闭,右开)`;

  

### DFS / BFS 

 **dfs:**一条路走的死,用栈实现,进栈、退栈，一搜到底!一般用递归实现

 **bfs:** 辐射八方,用队实现,入队、出队，步步为营!一般用迭代实现





### 二分搜索



### 备忘录法



### 双指针



### 快慢指针

###  

### 回溯算法



## **目录**

```swift
方法分类 ['.DS_Store', '贪心算法', 'Recursion', '双指针', 'DP', '二分查找']

二分查找 ['二分查找.playground', '.DS_Store', '二维数组中的查找.playground']

双指针 ['怎么查找两个view的公共父视图.playground', '盛最多水的容器.playground', '.DS_Store', '反转字符串.playground', '链表相交.playground', '判断子序列.playground']

贪心算法 ['README.md']

DP ['README.md']

Recursion ['反转链表.playground', '翻转二叉树.playground', '.DS_Store', '二叉树的深度 - maxDepth.playground', '1-100.playground', '对称的二叉树 - Symmetric.playground', 'travelsalSubViews.playground', 'README.md', '合并两个有序链表.playground', '平衡二叉树 - isBalanced .playground', '二叉树的镜像 - mirrorTree.playground']

```

```swift
结构分类 ['.DS_Store', '二叉树', '链表', '数组', '栈', '排序']

二叉树 ['二叉树的中序遍历.playground', '.DS_Store', '二叉树前序遍历 DFS.playground', '二叉树的最近公共祖先 1.playground', 'README.md', '二叉搜索树的最近公共祖先.playground', '二叉树的层序遍历BFS.playground']

链表 ['.DS_Store', '链表相交.playground', '通过view去找到对应的控制器.playground']

排序 ['.DS_Store', 'BubbleSort.playground']

数组 ['.DS_Store', ' 两数之和 II - 输入有序数组.playground', '两数之和.playground', '合并两个有序数组.playground', '只出现一次的数字.playground']

栈 ['.DS_Store', '翻转单词顺序.playground']
```



## 计划

https://www.zhihu.com/question/302483921/answer/1770931984

1.[整数排序](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/463/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

2.[反转一个3位整数](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/37//%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

3.[三数之中的最大值](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/283//%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

4.[从不充值的玩家](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/1921//%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

5.[寻找素数](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/298//%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

6.[寻找最大值](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/297//%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

7.[链表节点计数](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/466//%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

8.[矩阵面积](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/454//%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

9.[打印X](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/25//%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

10.[分数超过组长的组员](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/1919//%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

11.[硬币翻面](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/1927//%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

12.[张三的故事](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/1934//%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

13.[寻找特定的患者](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/1931//%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

14.[挂科最多的同学](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/1932//%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

15.[查询用户邮箱](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/1938//%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

16.[增长的疫情感染人数](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/1923//%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

17.[公租房信息查询](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/1930//%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

18.[查找重名的同学](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/1920//%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

19.[超过3名球员所得到的分数](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/1925//%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

20.[推荐学理科的同学](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/1924//%3Futm_source%3Dsc-zhihuniming-sy0309-2)

作者：匿名用户
链接：https://www.zhihu.com/question/302483921/answer/1770931984
来源：知乎
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。



**最让人头疼的动态规划，可以循序渐进的刷这10道题：** 

1.[栅栏染色](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/514/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

2.[爬楼梯](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/111/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

3.[约翰的后花园](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/749/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

4.[单词拆分](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/683/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

5.[书籍复印](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/437/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

6.[解码方法](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/512/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

7.[通配符匹配](https://link.zhihu.com/?target=http%3A//lintcode.com/problem/192/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

8.[旅行商问题](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/816/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

9.[青蛙跳](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/622/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

10.[骰子求和](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/20/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

**双指针算法，高频算法之王，变形比较多。想掌握的话，刷这些题：** 

1.[颜色分类](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/148/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

2.[两数之和 III-数据结构设计](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/607/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

3.[排颜色](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/143/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

4.[最长子串覆盖](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/32/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

5.[有效回文](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/891/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

6.[带环链表](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/102/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

7.[交错正负数](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/144/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

8.[最接近的三数之和](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/59/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

9.[四数之和](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/58/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

10.[接雨水](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/363/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

**宽度优先搜索，考察频率高，但实现不难，刷这7道题：** 

1.[岛屿的个数](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/433/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

2.[序列重构](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/605/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

3.[拓扑排序](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/127/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

4.[课程表](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/615/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

5.[买卖股票的最佳时期](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/151/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

6.[安排课程](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/616/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

7.[最大子数组差](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/45/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

**深度优先搜索，考察频率高，主要是考察递归会不会写。** 

1.[子集](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/17/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

2.[图是否是树](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/178/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

3.[子数组之和](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/138/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

4.[电话号码的字母组合](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/425/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

5.[K数和](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/90/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

6.[因式分解](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/652/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

**分治法，考察频率中等，一般和二叉树一起出现和考察，题一般不难。** 

1.[子集](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/17/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

2.[数组划分](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/31/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

3.[验证二叉查找树](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/95/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

4.[全排列](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/15/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

5.[克隆图](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/137/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

6.[排颜色](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/143/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

7.[子数组之和](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/138/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

**哈希表，原理和应用都需要掌握，而且需要掌握代码实现。** 

1.[两数之和](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/two-sum/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

2.[最长回文串](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/longest-palindrome/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

3.[两数组的交集](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/intersection-of-two-arrays/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

4.[数据流中第一个唯一的数字](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/first-unique-number-in-data-stream/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

5.[两数和 II-输入已排序的数组](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/two-sum-ii-input-array-is-sorted/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

**堆，经常会用到，原理必须掌握。高频。** 

1.[丑数](https://link.zhihu.com/?target=http%3A//lintcode.com/problem/4/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

2.[堆化](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/130/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

3.[滑动窗口的中位数](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/360/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

4.[大楼轮廓](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/131/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

5.[超级丑数](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/518/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

6.[食物集合](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/964/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

7.[影际网络](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/808/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

**贪心，考得不多，但起码要会用。** 

1.[会议室](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/919/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

2.[俄罗斯套娃信封](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/602/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

3.[最大乘积](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/304/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

4.[加油站](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/187/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

5.[最大子数组差](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/45/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

**链表，中小公司考得多，大公司近年来考得少。题目一般不难，主要考察Reference。** 

1.[合并k个排序链表](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/104/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

2.[数据流中第一个唯一的数字](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/685/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

3.[带环链表](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/102/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

4.[旋转链表](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/170/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

5.[两个链表的交叉](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/380/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

6.[K组翻转链表](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/450/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

**线段树，不太考。但当有的题目存在多种解法的时候，线段树可以帮忙降低思考难度。** 

1.[线段树的构造](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/201/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

2.[线段树的查询](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/202/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

3.[区间求和](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/207/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

4.[区间最小数](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/205/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

5.[我的日历](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/1063/%3Futm_source%3Dzhihuniming-sy0309-2) 

6.[排序方案](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/290/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

7.[构造队列](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/998/%3Futm_source%3Dsc-zhihuniming-sy0309-2) 

8.[矩形面积](https://link.zhihu.com/?target=https%3A//www.lintcode.com/problem/1450/%3Futm_source%3Dsc-zhihuniming-sy0309-2)