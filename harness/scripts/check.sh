#!/bin/sh
# scripts/check.sh — 一致性检查
# 用法：bash scripts/check.sh
# 返回：0（全通过）或 1（有失败）
# 支持平台：Linux / macOS / Windows（Git Bash）
# CI 验证：GitHub Actions ubuntu-latest + macos-latest
#
# Windows 运行方式：
#   Git Bash：bash scripts/check.sh
#   WSL：     wsl bash scripts/check.sh

set -eu
ROOT=$(cd "$(dirname "$0")/.." && pwd)
FAIL=0

ok()   { printf "\033[32m   ✓\033[0m %s\n" "$*"; }
fail() { printf "\033[31m   ✗\033[0m %s\n" "$*"; FAIL=1; }
warn() { printf "\033[33m  ! \033[0m %s\n" "$*"; }

echo ""
echo "  ──────────────────────────────"
echo "  一致性检查"
echo "  ──────────────────────────────"

# ── 进行中任务 ≤ 3 ─────────────────────────────────────────────
echo ""
echo "  进行中任务数量检查"
if [ -f "$ROOT/tasks.md" ]; then
  ACTIVE=$(sed -n '/^### 进行中/,/^## 待办区/p' "$ROOT/tasks.md" | grep -E '\*\*状态：\*\* (IN_PROGRESS|BLOCKED)' | wc -l | tr -d ' ')
  if [ "$ACTIVE" -le 3 ]; then
    ok "进行中：$ACTIVE 个（≤ 3）"
  else
    fail "进行中：$ACTIVE 个（超出上限 3）"
    echo "      → 将多余任务移到待办区"
  fi
else
  warn "tasks.md 不存在，跳过"
fi

# ── outputs/ 有文件时必须有 INDEX.md ────────────────────────────
echo ""
echo "  产出索引完整性检查"
OUTPUT_COUNT=$(find "$ROOT/outputs" -maxdepth 1 -type f ! -name "INDEX.md" 2>/dev/null | wc -l | tr -d ' ')
if [ "$OUTPUT_COUNT" -gt 0 ] && [ ! -f "$ROOT/outputs/INDEX.md" ]; then
  fail "outputs/ 有 $OUTPUT_COUNT 个文件，但缺少 INDEX.md"
  echo "      → 创建 outputs/INDEX.md 并登记产出"
elif [ -f "$ROOT/outputs/INDEX.md" ]; then
  ok "INDEX.md 存在（共 $OUTPUT_COUNT 个产出）"
else
  ok "outputs/ 无产出文件"
fi

# ── 核心文件存在 ────────────────────────────────────────────────
echo ""
echo "  核心文件完整性检查"
ALL_OK=true
for FILE in AGENTS.md SESSION.md specs.md rules.md tasks.md; do
  if [ ! -f "$ROOT/$FILE" ]; then
    fail "$FILE 缺失"
    ALL_OK=false
  fi
done
$ALL_OK && ok "所有核心文件存在"

# ── SESSION.md 新鲜度 ───────────────────────────────────────────
echo ""
echo "  会话新鲜度检查"
if [ -f "$ROOT/SESSION.md" ]; then
  if find "$ROOT/SESSION.md" -mtime +3 2>/dev/null | grep -q .; then
    warn "SESSION.md 已超过 3 天未更新（建议每次会话前更新）"
  else
    ok "SESSION.md 最近更新，状态新鲜"
  fi
else
  fail "SESSION.md 不存在"
  echo "      → 创建 SESSION.md 并填写当前状态"
fi

# ── 结果 ─────────────────────────────────────────────────────────
echo ""
echo "  ──────────────────────────────"
if [ "$FAIL" -eq 0 ]; then
  printf "\033[32m  全部通过\033[0m\n"
else
  printf "\033[31m  有失败项，提交前请修复\033[0m\n"
  exit 1
fi
echo ""