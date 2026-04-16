# skills

Personal agent skills following the [agentskills.io](https://agentskills.io) specification. Built for Claude Code, Codex, Cursor, Windsurf, Gemini CLI, and 40+ other coding agents.

## Install

```bash
# Install all skills globally
npx skills add klh/skills -g -y

# Install a specific skill
npx skills add klh/skills --skill cli-speed-tools

# Install from GitHub Pages (.well-known discovery)
npx skills add https://klh.github.io/skills/ -g -y

# List available skills
npx skills add klh/skills --list
```

## Skills

| Skill | Purpose |
|-------|---------|
| [cli-speed-tools](skills/cli-speed-tools/) | Replace standard CLI tools (ls, grep, find, cat) with faster modern alternatives (eza, rg, fd, bat) |
| [find-bugs](skills/find-bugs/) | Find bugs, security vulnerabilities, and code quality issues in local branch changes |
| [systematic-debugging](skills/systematic-debugging/) | Four-phase root cause analysis methodology — no fixes without root cause first |
| [code-simplifier](skills/code-simplifier/) | Simplify and refine code for clarity, consistency, and maintainability |
| [testing-patterns](skills/testing-patterns/) | Jest testing patterns, factory functions, mocking strategies, and TDD workflow |
| [zod-validation](skills/zod-validation/) | Zod schema validation patterns for API inputs and data validation |
| [lit-dev](skills/lit-dev/) | Build Lit web components with TypeScript, JSDoc, Zod validation, and Playwright |
| [core-components](skills/core-components/) | Core component library and design system patterns with design tokens |
| [openapi-directory-first](skills/openapi-directory-first/) | Look up public API specs from OpenAPI directory before consulting training data |
| [project-memory](skills/project-memory/) | Structured project memory tracking bugs, decisions, facts, and work history |
| [agents-md](skills/agents-md/) | Create and maintain AGENTS.md files for agent-agnostic project instructions |
| [settings-audit](skills/settings-audit/) | Generate recommended Claude Code settings.json based on detected tech stack |
| [all-skills](skills/all-skills/) | Global behavior modifier — guides verbosity, efficiency, and output style |

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

## License

MIT
