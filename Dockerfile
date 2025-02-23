# Start with pgvector base for runtime (no builder stage needed for Replit simplicity)
FROM ankane/pgvector:v0.5.1 AS runtime

# Install Python and minimal dependencies (no PostgreSQL needed locally)
RUN apt-get update && apt-get install -y \
    python3 \
    python3-venv \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /app

ARG LETTA_ENVIRONMENT=PRODUCTION
ENV LETTA_ENVIRONMENT=${LETTA_ENVIRONMENT} \
    VIRTUAL_ENV="/app/.venv" \
    PATH="/app/.venv/bin:$PATH" \
    LETTA_PG_URI=""  # Will be set via Replit Secrets \
    OPENAI_API_KEY=""  # Will be set via Replit Secrets \
    COMPOSIO_DISABLE_VERSION_CHECK=true

WORKDIR /app

# Copy the Letta application code
COPY . .

# Expose only Letta's server port (no PostgreSQL port)
EXPOSE 8283

# Command to start Letta server
CMD ["./letta/server/startup.sh"]