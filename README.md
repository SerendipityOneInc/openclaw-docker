# openclaw-docker

Custom OpenClaw Docker image with additional tools for the FastClaw platform.

## What's included

| Tool | Purpose |
|------|---------|
| [OpenClaw](https://openclaw.ai) | Base agent platform |
| [uv](https://github.com/astral-sh/uv) | Python package manager — ecap-skills scripts run via `uv run --with <deps>` |
| [mcporter](https://github.com/steipete/mcporter) | MCP client CLI/daemon — connects to external MCP servers |
| Chromium + Xvfb | Browser automation (inherited from 1panel base image) |

## Image lineage

```
openclaw/openclaw v2026.3.2          (GitHub source, official)
  -> 1panel/openclaw:2026.3.2        (Docker Hub, + preinstalled browser)
    -> ghcr.io/serendipityoneinc/openclaw-docker:2026.3.2  (+ uv + mcporter)
```

### Base image: 1panel/openclaw

[1panel/openclaw](https://hub.docker.com/r/1panel/openclaw) is built by [1Panel-dev/runtime](https://github.com/1Panel-dev/runtime) from the official [openclaw/openclaw](https://github.com/openclaw/openclaw) source code. The build process:

1. Downloads the openclaw source tarball for a specific git tag (e.g., `v2026.3.2`)
2. Builds with the standard Dockerfile (`pnpm install` + `pnpm build` + `pnpm ui:build`)
3. Adds `OPENCLAW_INSTALL_BROWSER=true` to preinstall Chromium and Xvfb
4. Publishes multi-arch images (`linux/amd64`, `linux/arm64`)

**Version mapping is 1:1** — `1panel/openclaw:2026.3.2` corresponds exactly to `openclaw/openclaw` git tag `v2026.3.2`. No source code modifications are made by 1panel.

### Version format

OpenClaw uses date-based versioning: **`YYYY.M.D`** (e.g., `2026.3.2` = March 2, 2026). New versions are released almost daily.

## Version management

### Pull a specific version

```bash
docker pull ghcr.io/serendipityoneinc/openclaw-docker:2026.3.2
```

### Build for a specific OpenClaw version

Three ways to trigger a versioned build:

**1. Manual workflow dispatch** (recommended for pinning versions):

Go to Actions > Build and Push Docker Image > Run workflow, and enter the desired `openclaw_version` (e.g., `2026.3.2`).

**2. Push a git tag**:

```bash
git tag v2026.3.2
git push origin v2026.3.2
# Builds ghcr.io/serendipityoneinc/openclaw-docker:2026.3.2
```

**3. Push to main** (builds `:latest` only):

```bash
git push origin main
# Builds ghcr.io/serendipityoneinc/openclaw-docker:latest
# Based on 1panel/openclaw:latest
```

### Deploying a pinned version

In Helm values (gcp-foundation):

```yaml
openclaw:
  image: \"ghcr.io/serendipityoneinc/openclaw-docker:2026.3.2\"
```

## Build locally

```bash
# Latest
docker build -t openclaw-docker .

# Specific version
docker build --build-arg OPENCLAW_VERSION=2026.3.2 -t openclaw-docker:2026.3.2 .
```

## Related

- [Design doc](https://github.com/SerendipityOneInc/agent-platform/blob/main/docs/plans/2026-03-05-openclaw-skill-deployment-design.md)
- [ECA-234](https://linear.app/srpone/issue/ECA-234)
- [1panel/openclaw tags](https://hub.docker.com/r/1panel/openclaw/tags)
- [openclaw/openclaw releases](https://github.com/openclaw/openclaw/releases)
"