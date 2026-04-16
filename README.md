# skills

My custom agent skills, following the [agentskills.io](https://agentskills.io) specification.

## Install

```bash
# Install all skills
npx skills add klh/skills

# Install a specific skill
npx skills add klh/skills --skill cli-speed-tools

# List available skills
npx skills add klh/skills --list
```

## Skills

| Skill | Description |
|-------|-------------|
| [cli-speed-tools](skills/cli-speed-tools/) | Replace slow standard CLI tools (ls, grep, find, cat) with faster modern alternatives |

## Development

```bash
npm run build:index    # Regenerate .well-known/agent-skills/index.json
```

## License

MIT
