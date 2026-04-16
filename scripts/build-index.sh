#!/usr/bin/env bash
set -euo pipefail

INDEX_DIR=".well-known/agent-skills"
INDEX_FILE="$INDEX_DIR/index.json"

mkdir -p "$INDEX_DIR"

# Copy SKILL.md files into .well-known so npx skills can fetch them
# npx skills expects: <base>/.well-known/agent-skills/<name>/SKILL.md
for skill_dir in skills/*/; do
  [ -f "$skill_dir/SKILL.md" ] || continue
  skill_name=$(basename "$skill_dir")
  mkdir -p "$INDEX_DIR/$skill_name"
  cp "$skill_dir/SKILL.md" "$INDEX_DIR/$skill_name/SKILL.md"
done

# Collect skills — use npx skills format (files array, not RFC v0.2.0 type/url/digest)
entries=()
for skill_dir in skills/*/; do
  [ -f "$skill_dir/SKILL.md" ] || continue

  skill_name=$(basename "$skill_dir")
  description=$(awk '/^---/{c++; next} c==1 && /^description:/{sub(/^description: */, ""); print; exit}' "$skill_dir/SKILL.md" | sed 's/\\/\\\\/g; s/"/\\"/g')

  entries+=("    {\"name\":\"${skill_name}\",\"description\":\"${description}\",\"files\":[\"SKILL.md\"]}")
done

# Write index.json
exec 3>"$INDEX_FILE"
echo "{" >&3
echo "  \"skills\": [" >&3

for i in "${!entries[@]}"; do
  if [ "$i" -gt 0 ]; then
    echo "," >&3
  fi
  printf '%s' "${entries[$i]}" >&3
done

echo "" >&3
echo "  ]" >&3
echo "}" >&3
exec 3>&-

echo "Built $INDEX_FILE with ${#entries[@]} skills"
