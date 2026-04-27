# skills

Personal agent skills following the [agentskills.io](https://agentskills.io) specification. Built for Claude Code, Codex, Cursor, Windsurf, Gemini CLI, and 40+ other coding agents.

Companion repos: **[speedy-claude](https://github.com/klh/speedy-claude)** (CLI speed tools + dotfiles) and **[addyosmani/agent-skills](https://github.com/addyosmani/agent-skills)** (20 production engineering skills).

## Install

```bash
# Install all skills globally
npx skills add klh/skills -g -y

# Install a specific skill
npx skills add klh/skills --skill klh-dispatch

# Install from GitHub Pages (.well-known discovery)
npx skills add https://klh.github.io/skills/ -g -y

# List available skills
npx skills add klh/skills --list
```

## Skills

| Skill | Purpose |
|-------|---------|
| [klh-dispatch](skills/klh-dispatch/) | Single entry-point orchestrator — detects task type and dispatches to the right skill |
| [klh-cli-speed-tools](skills/klh-cli-speed-tools/) | Replace standard CLI tools (ls, grep, find, cat) with faster modern alternatives (eza, rg, fd, bat) |
| [klh-find-bugs](skills/klh-find-bugs/) | Find bugs, security vulnerabilities, and code quality issues with Five Failure Modes checklist |
| [klh-systematic-debugging](skills/klh-systematic-debugging/) | Four-phase root cause analysis methodology — no fixes without root cause first |
| [klh-code-simplifier](skills/klh-code-simplifier/) | Simplify and refine code for clarity, consistency, and maintainability |
| [klh-testing-patterns](skills/klh-testing-patterns/) | Jest testing patterns, factory functions, mocking strategies, and TDD workflow with RED checkpoint |
| [klh-zod-validation](skills/klh-zod-validation/) | Zod schema validation patterns for API inputs and data validation |
| [klh-lit-dev](skills/klh-lit-dev/) | Build Lit web components with TypeScript, JSDoc, Zod validation, and Playwright |
| [klh-core-components](skills/klh-core-components/) | Core component library and design system patterns with design tokens |
| [klh-openapi-directory-first](skills/klh-openapi-directory-first/) | Look up public API specs from OpenAPI directory before consulting training data |
| [klh-project-memory](skills/klh-project-memory/) | Structured project memory tracking bugs, decisions, facts, and work history |
| [klh-agents-md](skills/klh-agents-md/) | Create and maintain AGENTS.md files for agent-agnostic project instructions |
| [klh-settings-audit](skills/klh-settings-audit/) | Generate recommended Claude Code settings.json based on detected tech stack |
| [klh-all-skills](skills/klh-all-skills/) | Global behavior modifier — guides verbosity, efficiency, and output style |

## Development

```bash
npm run build:index    # Regenerate .well-known/agent-skills/index.json
```

## Adding a New Skill

1. Create `skills/<name>/SKILL.md` with YAML frontmatter (`name` and `description` required)
2. Create `skills/<name>/package.json` with `@klh/skill-<name>` naming
3. Run `npm run build:index` to update the discovery index
4. Commit and push — GitHub Pages deploys automatically

## Architecture

```
skills/<name>/SKILL.md          # Each skill (discovered by npx skills)
.well-known/agent-skills/       # Auto-generated discovery index + SKILL.md copies
scripts/build-index.sh          # Regenerates the discovery index
.github/workflows/pages.yml     # Deploys to GitHub Pages
```

## Things you might find interesting

- [**speedy-claude**](https://github.com/klh/speedy-claude) — Claude Code dotfiles with 30+ CLI tools (eza, rg, fd, bat, delta, etc.), 7 slash commands, specialist agent personas, and install scripts. `npx skills add klh/speedy-claude -g -y`
- [**addyosmani/agent-skills**](https://github.com/addyosmani/agent-skills) — 20 production-grade engineering skills by Addy Osmani: spec-driven development, TDD, code review, security hardening, performance optimization, CI/CD, and more. `npx skills add addyosmani/agent-skills -g -y`
- [**agent-skills spec**](https://agentskills.io) — Open standard for packaging agent instructions. Skills are just directories with a SKILL.md.
- [**npx skills**](https://github.com/vercel-labs/skills) — Universal skill installer for 40+ coding agents (Claude Code, Codex, Cursor, Windsurf, Gemini CLI, etc.)

## License

MIT
