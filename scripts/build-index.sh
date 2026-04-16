#!/usr/bin/env bash
set -euo pipefail

INDEX_DIR=".well-known/agent-skills"
INDEX_FILE="$INDEX_DIR/index.json"
SCHEMA="https://schemas.agentskills.io/discovery/0.2.0/schema.json"
BASE_URL="${WELL_KNOWN_BASE_URL:-}"

mkdir -p "$INDEX_DIR"

# Collect skills
entries=()
for skill_dir in skills/*/; do
  [ -f "$skill_dir/SKILL.md" ] || continue

  skill_name=$(basename "$skill_dir")
  digest="sha256:$(shasum -a 256 "$skill_dir/SKILL.md" | cut -d' ' -f1)"
  description=$(awk '/^---/{c++; next} c==1 && /^description:/{sub(/^description: */, ""); print; exit}' "$skill_dir/SKILL.md")

  if [ -n "$BASE_URL" ]; then
    skill_url="${BASE_URL%/}/skills/${skill_name}/SKILL.md"
  else
    skill_url="/skills/${skill_name}/SKILL.md"
  fi

  entries+=("    {\"name\":\"${skill_name}\",\"type\":\"skill-md\",\"description\":\"${description}\",\"url\":\"${skill_url}\",\"digest\":\"${digest}\"}")
done

# Write index.json
exec 3>"$INDEX_FILE"
echo "{" >&3
echo "  \"\$schema\": \"$SCHEMA\"," >&3
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
