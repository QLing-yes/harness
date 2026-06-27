# 决策记录

> 关键决策的时间线。按时间倒序，最新的在最上面。
> 
> **写作原则：**
> - 只记录「不显而易见」的决策 — 普通人会问"为什么这么做？"的那种
> - 不要修改旧记录，觉得不对就新增一条「取代 DEC-NNN」
> - 每条 3-5 行，不需要写成论文

## ← 前置

当前任务引用了历史决策编号（DEC-xxx），或你想理解某个已有设计的原因。

## ● 当前

---

## DEC-001: C1 用正则过滤 DONE 状态

**日期：** 2026-06-26
**状态：** 生效中
**决定了什么：**
C1 进行中任务统计从 `grep -c '^#### TASK-'` 改为 `grep -cE '\*\*状态：\*\* (IN_PROGRESS|BLOCKED)'`，排除 DONE 任务。

**为什么：**
原逻辑按标题统计，DONE 任务留在进行中区时会被误算。状态字段才是准确信号。

**影响：**
→ 见 [check.sh](./scripts/check.sh) C1 段

---

## DEC-002: C4 用 POSIX find -mtime 替代 stat

**日期：** 2026-06-26
**状态：** 生效中
**决定了什么：**
C4 SESSION.md 新鲜度检查从 `stat -f/-c` + `date +%s` 计算天数改为 `find "$ROOT/SESSION.md" -mtime +3`。

**为什么：**
`stat -c` 非 POSIX，FreeBSD/OpenBSD 不可用。`find -mtime` 是 POSIX 原生命令，Linux/macOS/BSD 全平台兼容。

**影响：**
→ 见 [check.sh](./scripts/check.sh) C4 段

---

## DEC-003: CI 加 macOS 矩阵验证跨平台

**日期：** 2026-06-26
**状态：** 生效中
**决定了什么：**
GitHub Actions 从单一 `ubuntu-latest` 改为 `strategy.matrix.os: [ubuntu-latest, macos-latest]`。

**为什么：**
check.sh 刚做了跨平台修复，需要矩阵验证才能确保 Linux 和 BSD 系全部通过。

**影响：**
→ 见 [check.yml](../.github/workflows/check.yml)

---

## DEC-004: 模板示例领域无关化

**日期：** 2026-06-26
**状态：** 生效中
**决定了什么：**
模板占位符示例从编程领域措辞改为领域无关描述（技术栈示例、铁律示例、命名表 等 7 处）。

**为什么：**
harness 实例使用中发现模板示例全是编程语境，限制框架通用性。模板面向任意领域，示例反映的是实例自身领域（编程），而非用户可能的领域。

**影响：**
→ 见 [编码规范](./rules.md) 模板原则节

---

<!--
后续决策复制上面的格式，编号递增。

示例：

## DEC-002: 选择 SQLite 而不是 PostgreSQL

**日期：** 2026-06-22
**状态：** 生效中
**决定了什么：**
本地开发和生产都使用 SQLite，不引入 PostgreSQL。

**为什么：**
团队只有 2 人，部署目标是单台 VPS。PostgreSQL 的运维成本不值得。
如果未来并发需求超过 1000 QPS，再迁移。

**影响：**
→ 见 [编码规范](./rules.md) — 数据库操作规范节
-->

## → 下一步

返回 [任务追踪](./tasks.md) 继续执行。

