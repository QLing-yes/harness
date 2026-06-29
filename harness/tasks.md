# 任务追踪

## ← 前置

你已从 [AGENTS](./AGENTS.md) 拿到身份和铁律，从 [会话状态](./SESSION.md) 拿到当前目标。

## ● 当前

> 进行中任务上限 **3 个**。优先级用顺序表示，顶部 = 最高优先级。

### 进行中（≤ 3 个）

*暂无进行中任务*

## → 下一步

根据当前任务判断：

- **要执行实现** → 读 [编码规范](./rules.md)
- **不确定目标范围或验收标准** → 读 [项目目标](./specs.md)
- **任务提到了历史决策编号（DEC-xxx）** → 读 [决策记录](./DECISIONS.md)
- **需要复用验证过的提示词** → 读 [提示词库](./PROMPTS.md)
- **任务涉及已知的重复错误模式** → 读 [复盘记录](./feedback.md)
- **以上都不需要** → 直接执行任务

---

## 待办区（按优先级排序，顶部最优先）

*暂无待办任务*

## 已完成归档

#### TASK-001: 修改 AGENTS.md — 填写描述、技术栈、铁律
**完成时间：** 2026-06-26
**产出：** [AGENTS.md](./AGENTS.md)
AGENTS.md 已填写：项目描述、技术栈（Markdown + Shell）、4 条铁律。

#### TASK-002: 修改 README.md — 填写项目描述
**完成时间：** 2026-06-26
**产出：** [README.md](./README.md)
README.md 已填写：一句话描述 + "这是什么"段落。

#### TASK-003: 修改 SESSION.md — 填写本次会话目标
**完成时间：** 2026-06-26
**产出：** [SESSION.md](./SESSION.md)
SESSION.md 已填写：更新时间、本次目标、断点信息。

#### TASK-004: 修改 specs.md — 填写核心目标、验收标准、非目标、硬约束
**完成时间：** 2026-06-26
**产出：** [specs.md](./specs.md)
specs.md 已填写：核心目标、4 条验收标准、2 条非目标、硬约束表。

#### TASK-005: 修改 rules.md — 填写编码原则、命名约定、禁止项
**完成时间：** 2026-06-26
**产出：** [rules.md](./rules.md)
rules.md 已填写：6 条原则、命名约定表、3 条结构规则、2 条禁止项。

#### TASK-006: 修改 tasks.md — 将目标拆解为具体任务（自更新）
**完成时间：** 2026-06-26
**产出：** [tasks.md](./tasks.md)
tasks.md 已填写：6 个任务全部完成并归档。

#### TASK-009: 分析 — 总结 + 优化
**完成时间：** 2026-06-26
**产出：** SESSION / tasks / AGENTS / DECISIONS 联动更新
铁律合并、决策记录、AAIF 标准背景、SESSION 成果回溯。

#### TASK-012: 综合优化 — 模板清晰化 + INSTALL + 版本管理 + 规范沉淀
**完成时间：** 2026-06-26
**产出：** 多项（详见 SESSION 完成清单）
模板示例去编程化、INSTALL.md 改造为 AI 操作手册、版本号管理体系、rules 补原则、自治理结构化、根 README 重写。

#### TASK-013: 分析 — 占位符清零 + 编号连续 + 模板原则扩容
**完成时间：** 2026-06-27
**产出：** PROMPTS.md / DECISIONS.md / SESSION.md / template/rules.md
PROMPTS.md 2 处 {{YYYY-MM-DD}} → "未验证"、DEC-005 重编号为 DEC-004、SESSION 上下文更新、template/rules.md 扩至 5 条原则。

#### TASK-014: 自治理移入 harness/AGENTS.md
**完成时间：** 2026-06-27
**产出：** 根 AGENTS.md / harness/AGENTS.md
自治理章节从根 AGENTS.md 移入 harness/AGENTS.md 技术栈与铁律之间，根文件简化为路由规则。

---
