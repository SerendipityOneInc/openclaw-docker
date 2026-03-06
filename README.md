# openclaw-docker

Custom OpenClaw Docker image with additional tools for the FastClaw platform.

## What's included

| Tool | Purpose |
|------|---------|
| [OpenClaw](https://openclaw.ai) | Base agent platform |
| [uv](https://github.com/astral-sh/uv) | Python package manager — ecap-skills scripts run via `uv run --with <deps>` |
| [mcporter](https://github.com/steipete/mcporter) | MCP client CLI/daemon — connects to external MCP servers |

## Usage

```bash
docker pull ghcr.io/serendipityoneinc/openclaw-docker:latest
```

## Build locally

```bash
docker build -t openclaw-docker .
```

## Related

- [Design doc](https://github.com/SerendipityOneInc/agent-platform/blob/main/docs/plans/2026-03-05-openclaw-skill-deployment-design.md)
- [ECA-234](https://linear.app/srpone/issue/ECA-234)
