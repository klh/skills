# Skills Repo

Monorepo of agent skills following the [agentskills.io](https://agentskills.io) specification.

## Structure

- `skills/<name>/SKILL.md` — each skill (discovered by `npx skills`)
- `.well-known/agent-skills/index.json` — auto-generated discovery index (do not edit manually)
- `scripts/build-index.sh` — regenerates the discovery index

## Commands

- `npm run build:index` — regenerate `.well-known/agent-skills/index.json`
- `npx skills add . --list` — preview skills discoverable in this repo
- `npx skills add . --skill cli-speed-tools -a claude-code` — install a specific skill locally

## Adding a New Skill

1. Create `skills/<name>/SKILL.md` with YAML frontmatter (`name`, `description` required)
2. Create `skills/<name>/package.json` with `@klaushougesen/skill-<name>` naming
3. Run `npm run build:index` to update the discovery index
4. Commit and push — GitHub Pages deploys automatically

## Publishing

Others install via:
- `npx skills add klh/skills` — clone-based discovery
- `npx skills add https://klaushougesen.github.io/skills/.well-known/agent-skills/` — .well-known URL discovery

## Skill Migration Status

Skills migrated from `~/.claude/skills/`:
- [x] cli-speed-tools
- [ ] agents-md
- [ ] code-simplifier
- [ ] core-components
- [ ] find-bugs
- [ ] lit-dev
- [ ] openapi-directory-first
- [ ] project-memory
- [ ] settings-audit
- [ ] systematic-debugging
- [ ] testing-patterns
- [ ] zod-validation
