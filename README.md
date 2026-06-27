# Harness-Engineering

> AI 编程助手的"自动驾驶系统" — 结构化文件链路 + 机械检查 + 自进化闭环
> 模板结构详见 [template/README.md](./template/README.md)

## 🚀 [→ 快速接入/安装](./INSTALL.md)

## 智能体读取链路

```mermaid
flowchart TD
    START["🟢 智能体启动"] --> A

    A["📄 AGENTS<br/>← 前置：无<br/>● 身份 + 铁律 + 文件清单<br/>→ 下一步：读 SESSION"]
    A --> B

    B["📄 SESSION<br/>← 前置：已读 AGENTS<br/>● 本次目标 + 断点 + 备忘<br/>→ 下一步：读 tasks"]
    B --> C

    C["📄 tasks<br/>← 前置：已读 SESSION<br/>● 任务详情 + 待办 + 归档<br/>→ 下一步：按条件分支"]

    C -->|"要执行实现"| D
    C -->|"不确定目标范围/验收标准"| E
    C -->|"任务引用了历史决策编号 DEC-xxx"| F
    C -->|"需要复用验证过的提示词"| G
    C -->|"任务涉及已知重复错误模式"| H
    C -->|"以上都不需要"| EXEC

    D["📄 rules<br/>← 前置：已读 tasks<br/>● 原则 + 命名 + 结构 + 禁止项<br/>→ 下一步：返回执行"]
    D --> EXEC

    E["📄 specs<br/>← 前置：已读 SESSION + tasks<br/>● 核心目标 + 验收 + 非目标 + 硬约束<br/>→ 下一步：返回 tasks"]
    E --> C

    F["📄 DECISIONS<br/>← 前置：任务引用了历史决策<br/>● 决策记录 DEC-xxx<br/>→ 下一步：返回 tasks"]
    F --> C

    G["📄 PROMPTS<br/>← 前置：需要提示词话术<br/>● 验证过的提示词库<br/>→ 下一步：返回 tasks"]
    G --> C

    H["📄 feedback<br/>← 前置：涉及已知错误模式<br/>● 追加式复盘 + 重复模式<br/>→ 下一步：返回 tasks"]
    H --> C

    EXEC["⚡ 执行任务"]

    style A fill:#1a1a2e,stroke:#e94560,color:#fff
    style B fill:#1a1a2e,stroke:#0f3460,color:#fff
    style C fill:#1a1a2e,stroke:#16213e,color:#fff
    style D fill:#16213e,stroke:#533483,color:#fff
    style E fill:#16213e,stroke:#533483,color:#fff
    style F fill:#16213e,stroke:#533483,color:#fff
    style G fill:#16213e,stroke:#533483,color:#fff
    style H fill:#16213e,stroke:#533483,color:#fff
    style EXEC fill:#0f3460,stroke:#00ff88,color:#fff
    style START fill:#000,stroke:#00ff88,color:#0f0
```

## 这是什么

Harness-Engineering 是一个 AI 自治理框架。用一套 Markdown 文件让 AI 编程助手在每次会话中自动获取项目上下文、遵守规范、自我检查、持续进化 — 不再每次从零开始。

## 本项目

本仓库是 Harness-Engineering 框架的**开发与维护项目**，自身也用 Harness 管理（dogfooding）。

| 目录 | 用途 |
|------|------|
| `template/` | 通用模板 — 领域无关，含 `{{占位符}}`，供任何项目克隆使用 |
| `harness/` | 本项目实例 — 真实内容，在 dogfooding 中验证模板、生成最佳实践 |

两套文件双向反哺：模板定义规范 → 实例实践验证 → 发现缺陷反哺模板 → 共同进化。

```mermaid
flowchart TD
    TPL["📄 template/<br/>通用模板<br/>{{占位符}} + 领域无关示例"]
    INS["📄 harness/<br/>自用实例<br/>真实内容 + dogfooding 验证"]

    TPL -->|"固定内容同步"| INS
    INS -->|"使用中发现模板缺陷<br/>反哺改进"| TPL
```

## 解决什么问题

AI 编程助手每次对话从零开始 — 忘了上次做到哪、不知道项目规范、改了文件不检查。Harness 让 AI **自己读、自己守规矩、自己检查**。

## 亮点

| 亮点 | 说明 |
|------|------|
| **渐进式读取** | 文件链逐级引导，AI 不预读、不跳步，token 只花在刀口上 |
| **机械检查** | `check.sh` 4 项自动校验，pre-commit hook 提交前拦截 |
| **模板实例共进化** | template 保持通用，harness dogfooding 验证并反哺 |
| **自进化闭环** | 说"分析"触发 7 步自检，项目越用越规范 |
| **零依赖** | 只需 Markdown + Shell |
