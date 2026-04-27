# Skills Repo

Monorepo of agent skills following the [agentskills.io](https://agentskills.io) specification.

## Structure

- `skills/klh-<name>/SKILL.md` — each skill (discovered by `npx skills`)
- `.well-known/agent-skills/index.json` — auto-generated discovery index (do not edit manually)
- `scripts/build-index.sh` — regenerates the discovery index

## Commands

- `npm run build:index` — regenerate `.well-known/agent-skills/index.json`
- `npx skills add . --list` — preview skills discoverable in this repo
- `npx skills add . --skill klh-dispatch -a claude-code` — install a specific skill locally

## Adding a New Skill

1. Create `skills/klh-<name>/SKILL.md` with YAML frontmatter (`name`, `description` required)
2. Create `skills/klh-<name>/package.json` with `@klh/skill-klh-<name>` naming
3. Run `npm run build:index` to update the discovery index
4. Commit and push — GitHub Pages deploys automatically

## Publishing

Others install via:
- `npx skills add klh/skills` — clone-based discovery
- `npx skills add https://klh.github.io/skills/` — .well-known URL discovery
