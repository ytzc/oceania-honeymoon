#!/usr/bin/env bash
# release.sh — 版本號 stamp + tag + push
# 用法：
#   ./release.sh v0.18.2   → 指定版本號
#   ./release.sh           → 自動遞增 patch（v0.X.Y → v0.X.Y+1）
#
# 流程：
#   1. （若未指定）從上一個 tag 自動遞增 patch 版本
#   2. 顯示本次 release 包含的 commits 摘要
#   3. 將 HTML 裡的 __VERSION__ 替換為指定 tag
#   4. git commit + git tag
#   5. push main + push tag
#   6. 還原 __VERSION__ placeholder 並 commit（保持 source 乾淨）

set -eE

# 若 push 失敗仍還原 placeholder
restore_placeholder() {
  local tag="$1"
  echo "→ 還原 __VERSION__ placeholder..."
  for f in "${TARGETS[@]}"; do
    [ -f "$f" ] && sed -i "s/$tag/__VERSION__/g" "$f"
  done
  git add "${TARGETS[@]}" 2>/dev/null || true
  git diff --cached --quiet || git commit -m "chore: restore __VERSION__ placeholder after $tag"
}

TARGETS=(docs/okinawa.html docs/oceania.html docs/index.html)

# ── 自動偵測 / 驗證版本號 ─────────────────────────────
TAG="$1"
LAST_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "")

if [ -z "$TAG" ]; then
  if [ -z "$LAST_TAG" ]; then
    echo "❌ 找不到任何既有 tag，請手動指定版本號"
    echo "   用法：./release.sh v0.1.0"
    exit 1
  fi
  # 解析 v0.X.Y → 遞增 patch
  if [[ "$LAST_TAG" =~ ^v([0-9]+)\.([0-9]+)\.([0-9]+)$ ]]; then
    TAG="v${BASH_REMATCH[1]}.${BASH_REMATCH[2]}.$((BASH_REMATCH[3] + 1))"
  else
    echo "❌ 上一個 tag 格式不符（$LAST_TAG），請手動指定版本號"
    exit 1
  fi
  echo "→ 上一個 tag：$LAST_TAG　→　自動遞增至 $TAG"
fi

# ── 確認 tag 尚未存在（本地 + remote）──────────────────
if git tag | grep -qx "$TAG"; then
  echo "❌ 錯誤：local tag '$TAG' 已存在，請選用新版本號或先執行：git tag -d $TAG"
  exit 1
fi
if git ls-remote --tags origin | grep -q "refs/tags/$TAG$"; then
  echo "❌ 錯誤：remote tag '$TAG' 已存在，請選用新版本號"
  exit 1
fi

# ── 顯示本次 release 包含的 commits ────────────────────
UNPUSHED=$(git log origin/main..HEAD --oneline 2>/dev/null || true)
UNPUSHED_COUNT=$(echo "$UNPUSHED" | grep -c . 2>/dev/null || echo 0)

echo ""
echo "╔══════════════════════════════════════════╗"
echo "  📦  Release  $TAG"
echo "╚══════════════════════════════════════════╝"
if [ -n "$LAST_TAG" ] && [ -n "$UNPUSHED" ]; then
  echo ""
  echo "commits 尚未推送（$UNPUSHED_COUNT）："
  echo "$UNPUSHED" | sed 's/^/  /'
fi
if [ -n "$LAST_TAG" ]; then
  SINCE_TAG=$(git log "$LAST_TAG"..HEAD --oneline 2>/dev/null || true)
  if [ -n "$SINCE_TAG" ]; then
    echo ""
    echo "commits since $LAST_TAG："
    echo "$SINCE_TAG" | sed 's/^/  /'
  fi
fi
echo ""

# ── 標記版本、commit、tag ──────────────────────────────
echo "→ 標記版本 $TAG..."
for f in "${TARGETS[@]}"; do
  [ -f "$f" ] && sed -i "s/__VERSION__/$TAG/g" "$f"
done

echo "→ git add + commit..."
git add "${TARGETS[@]}" 2>/dev/null || true
git commit -m "release: $TAG"

echo "→ git tag $TAG..."
git tag "$TAG"

# ── push ──────────────────────────────────────────────
echo "→ push main + tag..."
GIT_TERMINAL_PROMPT=0 timeout 60 git push origin main \
  || { echo "❌ push main 失敗（逾時或認證錯誤）"; restore_placeholder "$TAG"; exit 1; }
GIT_TERMINAL_PROMPT=0 timeout 30 git push origin "$TAG" \
  || { echo "❌ push tag 失敗"; restore_placeholder "$TAG"; exit 1; }

restore_placeholder "$TAG"
GIT_TERMINAL_PROMPT=0 timeout 60 git push origin main \
  || { echo "❌ push restore 失敗（本地已還原，可手動 push）"; exit 0; }

echo ""
echo "✅ 完成：$TAG 已發布，source 已還原 placeholder"
