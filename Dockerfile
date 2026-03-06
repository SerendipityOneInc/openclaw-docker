FROM openclaw/openclaw:latest

# Install uv — ecap-skills scripts run via `uv run --with <deps>`
# Install mcporter — MCP server CLI/daemon for external tool connections
USER root
RUN curl -LsSf https://astral.sh/uv/install.sh | sh \
    && mv /root/.local/bin/uv /usr/local/bin/uv \
    && chmod +x /usr/local/bin/uv \
    && npm install -g mcporter
USER node

# Create mcporter config directory
RUN mkdir -p /home/node/.mcporter
