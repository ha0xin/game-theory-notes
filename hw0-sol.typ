#import "/lib.typ": *

#show: project.with(
  title: "博弈论导论作业",
  date: auto,
)

#set enum(numbering: "(1)")

#problem[
考虑“一字棋”游戏: 两个参与人在一个 $3 times 3$ 矩阵中轮流画 “X” 或者“O”。参与人 $1$ 先行动, 画 “X”; 然后是参与人 $2$ 行动, 画 “O”; 依此类推。如果其中一个参与人率先使得三子成一行、一列或者对角线, 那么他就赢了, 否则就是平局。对于该问题, 我们还要假设即使已经有一名胜利者, 参与人在游戏结束之前也必须完整地填满这个矩阵。

问题:
+ 参与人 $2$ 第一次需要选择行动 (即在参与人 $1$ 第一次行动之后) 的信息集有多少个?
+ 参与人 $1$ 第二次需要选择行动 (即在参与人 $2$ 第一次行动之后) 的信息集有多少个?
+ 每个参与人各有多少个信息集?
+ 该博弈有多少个终节点?
]

这里博弈是完全信息的，所以信息集数量就是节点数量。

(1) 9 个.

(2) 为 $9 times 8 =$ #(9 * 8) 个.

(3) 对参与人1，其在奇数步做选择，信息集数量为
$
  1 + 9 times 8
  + 9 times 8 times 7 times 6
  + 9 times 8 times 7 times 6 times 5 times 4
  + 9 times 8 times 7 times 6 times 5 times 4 times 3 times 2
  = #(1 + 9 * 8 + 9 * 8 * 7 * 6 + 9 * 8 * 7 * 6 * 5 * 4 + 9 * 8 * 7 * 6 * 5 * 4 * 3 * 2).
$
对参与人2，其在偶数步做选择，信息集数量为
$
  9 + 9 times 8 times 7
  + 9 times 8 times 7 times 6 times 5
  + 9 times 8 times 7 times 6 times 5 times 4 times 3
  = #(9 + 9 * 8 * 7 + 9 * 8 * 7 * 6 * 5 + 9 * 8 * 7 * 6 * 5 * 4 * 3).
$

#h(2em) (4) 该博弈的终节点数量为 $9! = #(calc.fact(9)).$

#problem[
考虑下图中的两个博弈，分别确定哪些参与者具有完美回忆，为什么？
#figure(image("img/0-2.png",width: 80%))
]

图A中两人都有完美回忆。

图B中参与者1没有完美回忆，因为他可以用第一轮选择结果来推断出他在图中红色虚线连接的哪个节点。换句话说，如果他认为图中红色虚线连接的节点属于同一信息集，那么他就忘记了自己在第一轮选择的结果，这违反了完美回忆的定义。

#problem[
考虑下图所示的博弈，写出该博弈的策略式表述。
#figure(image("img/0-3.png",width: 40%))

]

参与者1有4种策略：$a c,a d,b c,b d$，而参与者2有2种策略：$e,f$.
#figure(
  table(
    columns: 4,
    align: center,
    stroke: 0.4pt,
    table.hline(y: 0, stroke: none),
    table.hline(y: 1, stroke: none, end: 2),
    table.hline(y: 2, stroke: none, end: 1),
    table.hline(y: 6, stroke: none, end: 1),
    table.vline(x: 0, stroke: none),
    table.vline(x: 1, stroke: none, end: 2),
    table.vline(x: 2, stroke: none, end: 1),
    table.vline(x: 4, stroke: none, end: 1),
    [],
    [],
    table.cell(
      colspan: 2,
      align: center,
      fill: silver,
    )[参与者2],
    [], [], [$e$], [$f$],
    table.cell(
      rowspan: 4,
      align: horizon,
      fill: silver,
    )[参与者1],
    [$(a,c)$], [(0,0)], [(0,0)],
    [$(a,d)$], [(0,0)], [(0,0)],
    [$(b,c)$], [(#(-6 / 2 + 48 / 2),#(30 / 2 + 0 / 2))], [(#(-6 / 2 + 8 / 2),#(30 / 2 + 72 / 2))],
    [$(b,d)$], [(#(24 / 2 + 48 / 2),#(24 / 2 + 0 / 2))], [(#(24 / 2 + 8 / 2),#(24 / 2 + 72 / 2))],
  ),
)

#problem[
考虑下图所示的博弈，写出该博弈的策略式表述。
#figure(image("img/0-4.png",width: 40%))
]
他们的策略集为

$ S_1={a,b} $
$ S_2={c e,c f,d e,d f} $
$ S_3={g,h} $

策略表述为

#figure(
  table(
    columns: 7,
    align: (
      left,
      center + horizon,
      center + horizon,
      center + horizon,
      center + horizon,
      center + horizon,
      center + horizon,
    ),
    stroke: 0.4pt,
    table.hline(y: 1, stroke: none, start: 1, end: 3),
    table.hline(y: 5, stroke: none, start: 1, end: 3),
    table.vline(x: 2, stroke: none, end: 2),
    table.vline(x: 2, stroke: none, start: 4, end: 6),
    table.cell(
      rowspan: 4,
      align: center + horizon,
      fill: silver,
    )[丙$g$],
    [],
    [],
    table.cell(
      colspan: 4,
      align: center,
      fill: silver,
    )[乙],
    [],
    [],
    [$c e$],
    [$c f$],
    [$d e$],
    [$d f$],
    table.cell(
      rowspan: 2,
      fill: silver,
    )[甲],
    [$a$],
    [(0,3,6)],
    [(0,3,6)],
    [(0,9,20)],
    [(0,9,20)],
    [$b$],
    [(8,2,5)],
    [(1,2,3)],
    [(8,2,5)],
    [(1,2,3)],
    table.cell(
      rowspan: 4,
      align: center + horizon,
      fill: silver,
    )[丙$h$],
    [],
    [],
    table.cell(
      colspan: 4,
      align: center,
      fill: silver,
    )[乙],
    [],
    [],
    [$c e$],
    [$c f$],
    [$d e$],
    [$d f$],
    table.cell(
      rowspan: 2,
      fill: silver,
    )[甲],
    [$a$],
    [(0,3,6)],
    [(0,3,6)],
    [(5,8,2)],
    [(5,8,2)],
    [$b$],
    [(6,3,0)],
    [(1,2,3)],
    [(6,3,0)],
    [(1,2,3)],
  ),
)

#problem[
考虑下图所示的博弈: 对于下述混合策略组合($sigma_1$,$sigma_2$):

$ sigma_1=frac(3,7)[a g t]+frac(4,7)[a h s]+frac(2,7)[b g t]+frac(4,7)[b h w], quad sigma_2=frac(3,7)[c e]+frac(4,7)[c f]+frac(2,7)[d e]+frac(4,7)[d f] $

 1. 请你写出每个混合策略的行为表示。
 2. 将上一步所写的行为策略重新表示为混合策略。
#figure(image("img/0-5.png",width: 50%))
]

下面把给定的“纯策略混合”写成行为策略。

参与者 1混合策略为
$ sigma_1 = frac(3, 7)[a g t] + frac(1, 7)[a h s] + frac(2, 7)[b g t] + frac(1, 7)[b h w]. $

根节点（选 $a$ 或 $b$）：
$ P(a)=frac(3+1, 7)=frac(4, 7), quad P(b)=frac(2+1, 7)=frac(3, 7). $

左侧信息集（在到达 $a$ 的前提下，选 $g$ / $h$）：
$ P(g | a)=frac(3/7, 4/7)=frac(3, 4), quad P(h | a)=frac(1/7, 4/7)=frac(1, 4). $

右侧节点（在到达 $b$ 的前提下，选 $s$/$t$/$w$）：
$ P(s | b)=0, quad P(t | b)=frac(2/7, 3/7)=frac(2, 3), quad P(w | b)=frac(1/7, 3/7)=frac(1, 3). $

参与者1的行为策略为
$ (4/7 a+ 3/7 b, 3/4 g+ 1/4 h, 0 s+2/3 t+ 1/3 w) $

#h(2em) 参与者 2 纯策略混合为
$ sigma_2 = frac(3, 7)[c e] + frac(1, 7)[c f] + frac(1, 7)[d e] + frac(2, 7)[d f]. $

#h(2em) 参与者 2 有两个信息集：左端结点（$c$/$d$）与右端信息集（$e$/$f$）。

左端结点
$ P(c)=frac(3+1, 7)=frac(4, 7), quad P(d)=frac(1+2, 7)=frac(3, 7). $
右侧信息集
$ P(e)=frac(3+1, 7)=frac(4, 7), quad P(f)=frac(1+2, 7)=frac(3, 7). $

参与者 2 的行为策略：
$
  (4/7 c+ 3/7 d, 4/7 e+ 3/7 f)
$

#h(2em) 将上述行为策略再写回混合策略：

参与者 1（共有 $2 times 2 times 3 = 12$ 个纯策略，其中 $s$ 的概率为 0）：

$
  [a g t] &= frac(4, 7) dot frac(3, 4) dot frac(2, 3) = frac(2, 7), quad
  &&[a g w] = frac(4, 7) dot frac(3, 4) dot frac(1, 3) = frac(1, 7), \
  [a h t] &= frac(4, 7) dot frac(1, 4) dot frac(2, 3) = frac(2, 21), quad
  &&[a h w] = frac(4, 7) dot frac(1, 4) dot frac(1, 3) = frac(1, 21),\
  [b g t] &= frac(3, 7) dot frac(3, 4) dot frac(2, 3) = frac(3, 14), quad
  &&[b g w] = frac(3, 7) dot frac(3, 4) dot frac(1, 3) = frac(3, 28),\
  [b h t] &= frac(3, 7) dot frac(1, 4) dot frac(2, 3) = frac(1, 14), quad
  &&[b h w] = frac(3, 7) dot frac(1, 4) dot frac(1, 3) = frac(1, 28),\
$

其余含 $s$ 的四个纯策略概率为 $0$。以上 8 个概率相加为 $1$。

参与者 2（4 个纯策略）：

$
  [c e] = frac(4, 7) dot frac(4, 7) = frac(16, 49), quad
  [c f] = frac(4, 7) dot frac(3, 7) = frac(12, 49), quad
  [d e] = frac(3, 7) dot frac(4, 7) = frac(12, 49), quad
  [d f] = frac(3, 7) dot frac(3, 7) = frac(9, 49),
$

四者之和为 $1$。
