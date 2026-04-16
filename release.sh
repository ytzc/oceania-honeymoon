#!/usr/bin/env bash
# release.sh — 版本號 stamp + tag + push
# 用法：./release.sh v0.18.2
#
# 流程：
#   1. 將 HTML 裡的 __VERSION__ 替換為指定 tag
#   2. git commit + git tag
#   3. push main + push tag
#   4. 還原 __VERSION__ placeholder 並 commit（保持 source 乾淨）

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

TAG="$1"
if [ -z "$TAG" ]; then
  echo "用法：./release.sh <tag>  例如：./release.sh v0.18.2"
  exit 1
fi

# 確認 tag 尚未存在（本地 + remote）
if git tag | grep -qx "$TAG"; then
  echo "❌ 錯誤：local tag '$TAG' 已存在，請選用新版本號或先執行：git tag -d $TAG"
  exit 1
fi
if git ls-remote --tags origin | grep -q "refs/tags/$TAG$"; then
  echo "❌ 錯誤：remote tag '$TAG' 已存在，請選用新版本號"
  exit 1
fi

TARGETS=(docs/okinawa.html docs/oceania.html docs/index.html)

echo "→ 標記版本 $TAG..."
for f in "${TARGETS[@]}"; do
  [ -f "$f" ] && sed -i "s/__VERSION__/$TAG/g" "$f"
done

echo "→ git add + commit..."
git add "${TARGETS[@]}" 2>/dev/null || true
git commit -m "release: $TAG"

echo "→ git tag $TAG..."
git tag "$TAG"

echo "→ push main + tag..."
GIT_TERMINAL_PROMPT=0 timeout 60 git push origin main \
  || { echo "❌ push main 失敗（逾時或認證錯誤）"; restore_placeholder "$TAG"; exit 1; }
GIT_TERMINAL_PROMPT=0 timeout 30 git push origin "$TAG" \
  || { echo "❌ push tag 失敗"; restore_placeholder "$TAG"; exit 1; }

restore_placeholder "$TAG"
GIT_TERMINAL_PROMPT=0 timeout 60 git push origin main \
  || { echo "❌ push restore 失敗（本地已還原，可手動 push）"; exit 0; }

echo "✅ 完成：$TAG 已發布，source 已還原 placeholder"
