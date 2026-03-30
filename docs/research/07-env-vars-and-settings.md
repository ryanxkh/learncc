# Complete Environment Variables & Settings Reference

Source: Official docs, community gists, GitHub issues, practitioner blogs

## Timeout & Execution (THE Most Common Pain Points)

| Variable | Default | Set To | Why |
|---|---|---|---|
| BASH_DEFAULT_TIMEOUT_MS | 120,000 (2 min) | 1,800,000 (30 min) | Long builds/tests/migrations hit 2 min |
| BASH_MAX_TIMEOUT_MS | 600,000 (10 min) | 3,600,000 (60 min) | Hard ceiling Claude can request |
| BASH_MAX_OUTPUT_LENGTH | 30,000 chars | 100,000 | See full build logs without truncation |
| API_TIMEOUT_MS | 600,000 (10 min) | higher | High-latency enterprise networks |
| CLAUDE_STREAM_IDLE_TIMEOUT_MS | 90,000 (90s) | 300,000 | Slow connections or buffering proxies |
| MCP_TIMEOUT | 30,000 (30s) | higher | Slow-starting MCP servers |

## Context & Compaction

| Variable | Default | Notes |
|---|---|---|
| CLAUDE_AUTOCOMPACT_PCT_OVERRIDE | 95% | Lower to 70-80 for proactive compaction |
| CLAUDE_CODE_DISABLE_1M_CONTEXT | unset | Set if provider doesn't support extended context |
| CLAUDE_CODE_FILE_READ_MAX_OUTPUT_TOKENS | - | Prevent single large files from eating context |
| MAX_MCP_OUTPUT_TOKENS | 25,000 | Raise for MCP tools returning large datasets |
| ENABLE_TOOL_SEARCH | - | auto=load schemas when <10% context, false=load all upfront |
| SLASH_COMMAND_TOOL_CHAR_BUDGET | 2% of context | Override skill description character budget |

## Model Selection & Performance

| Variable | Default | Notes |
|---|---|---|
| ANTHROPIC_MODEL | claude-sonnet-4-6 | Override primary model |
| ANTHROPIC_SMALL_FAST_MODEL | latest haiku | Model for background operations (dozens per session) |
| CLAUDE_CODE_SUBAGENT_MODEL | inherits main | Run cheap subagents on Haiku, main on Opus |
| CLAUDE_CODE_MAX_OUTPUT_TOKENS | 32,000 | Increase up to 64,000 for large generation tasks |
| MAX_THINKING_TOKENS | 31,999 | Cap thinking budget; raise for complex reasoning |
| CLAUDE_CODE_EFFORT_LEVEL | auto | low/medium/high/max |
| ANTHROPIC_CUSTOM_MODEL_OPTION | - | Add custom models to /model picker |

## Feature Disable Flags (set to 1)

| Variable | What It Does |
|---|---|
| CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC | Bundle kill: updater, reports, telemetry |
| CLAUDE_CODE_DISABLE_AUTO_MEMORY | Turn off auto memory |
| CLAUDE_CODE_DISABLE_GIT_INSTRUCTIONS | Free ~2K system prompt tokens |
| CLAUDE_CODE_DISABLE_THINKING | Force non-thinking mode |
| CLAUDE_CODE_DISABLE_ADAPTIVE_THINKING | Disable adaptive reasoning |
| CLAUDE_CODE_DISABLE_FAST_MODE | Force standard pipeline |
| CLAUDE_CODE_DISABLE_BACKGROUND_TASKS | Reduce background API calls |
| CLAUDE_CODE_DISABLE_CRON | Stop all scheduled tasks |
| DISABLE_PROMPT_CACHING | Debug stale context issues |
| DISABLE_TELEMETRY | Stop telemetry only |
| DISABLE_AUTOUPDATER | Pin current version |

## Feature Enable Flags

| Variable | What It Does |
|---|---|
| CLAUDE_CODE_NEW_INIT=true | Interactive /init with skills, hooks, memory setup |
| CLAUDE_CODE_ENABLE_TASKS | Enable task tracking system |
| CLAUDE_CODE_TASK_LIST_ID=<name> | Share task list across sessions |
| ENABLE_PROMPT_CACHING_1H_BEDROCK | 1-hour caching on Bedrock |

## Cloud Providers

### AWS Bedrock
CLAUDE_CODE_USE_BEDROCK=1, AWS_REGION, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY,
AWS_SESSION_TOKEN, CLAUDE_CODE_SKIP_BEDROCK_AUTH, ANTHROPIC_SMALL_FAST_MODEL_AWS_REGION

### Google Vertex AI
CLAUDE_CODE_USE_VERTEX=1, ANTHROPIC_VERTEX_PROJECT_ID, CLOUD_ML_REGION,
GOOGLE_APPLICATION_CREDENTIALS, CLAUDE_CODE_SKIP_VERTEX_AUTH

### Microsoft Foundry (Azure)
CLAUDE_CODE_USE_FOUNDRY=1, ANTHROPIC_FOUNDRY_BASE_URL, ANTHROPIC_FOUNDRY_API_KEY,
CLAUDE_CODE_SKIP_FOUNDRY_AUTH

## Networking & Security

| Variable | Notes |
|---|---|
| HTTP_PROXY / HTTPS_PROXY | Standard proxy config |
| NO_PROXY | Bypass proxy for specific hosts |
| NODE_EXTRA_CA_CERTS | Custom root CAs (fixes CERT_UNTRUSTED) |
| CLAUDE_CODE_CLIENT_CERT + CLAUDE_CODE_CLIENT_KEY | mTLS paths |
| ANTHROPIC_CUSTOM_HEADERS | Inject headers to every API request |
| ANTHROPIC_UNIX_SOCKET | Unix socket for restricted environments |

## OpenTelemetry (Full Observability)

OTEL_EXPORTER_OTLP_ENDPOINT, OTEL_TRACES_EXPORTER, OTEL_METRICS_EXPORTER,
OTEL_LOGS_EXPORTER, CLAUDE_CODE_OTEL_FLUSH_TIMEOUT_MS, otelHeadersHelper setting

Pipe every session into Datadog, Jaeger, Grafana, or any OTLP backend.

## Tool & Shell Execution

| Variable/Setting | Default | Notes |
|---|---|---|
| CLAUDE_CODE_SHELL | $SHELL or bash | Set to zsh for aliases/functions |
| CLAUDE_CODE_MAX_TOOL_USE_CONCURRENCY | 10 | Lower to 1 for debugging ordering |
| CLAUDE_CODE_USE_POWERSHELL_TOOL | unset | Use PowerShell on Windows |

## Debugging & Introspection

| Tool | Notes |
|---|---|
| ANTHROPIC_LOG=debug | HTTP-level API logging |
| CLAUDE_CODE_DEBUG_LOG_LEVEL | verbose/debug/info/warn/error |
| CLAUDE_DEBUG=1 | Global debug mode |
| claude --debug "api,hooks" | Category filtering (!prefix to exclude) |
| Ctrl+O | Toggle verbose mid-session |
| claude auth status --text | Human-readable auth + exit code for scripting |
| claude auto-mode defaults | Print classifier rules as JSON |

## The env Block (Recommended Approach)

In settings.json, cleaner than shell exports, scoped and version-controllable:

```json
{
  "env": {
    "BASH_DEFAULT_TIMEOUT_MS": "1800000",
    "BASH_MAX_TIMEOUT_MS": "7200000",
    "BASH_MAX_OUTPUT_LENGTH": "100000",
    "CLAUDE_AUTOCOMPACT_PCT_OVERRIDE": "80",
    "ANTHROPIC_SMALL_FAST_MODEL": "claude-haiku-4-5"
  }
}
```
