# Claude Code Workflow

A ready-to-clone Claude Code setup with **43 specialized sub-agents** and **liteLLM model routing** — so you can hit the ground running with Claude Code on any machine. **EVEN IF YOU'RE BROKE**

## How it works

```
claude (terminal)
    │
    ▼
liteLLM proxy (:4000)
    ├─ "claude-sonnet-4-5-20250929"    →  DeepSeek v4 Pro  (main conversation)
    └─ "claude-haiku-4-5-20251001"     →  Ollama Gemma 4    (sub-agents, local)
```

Claude Code connects to liteLLM thinking it's talking to Anthropic. liteLLM intercepts the hardcoded model names and routes them to whichever backend you configure — in this case **DeepSeek for the heavy lifting** and a **local Gemma model for sub-agents**.

## What's included

| Item | Description |
|---|---|
| 41 sub-agents | From [awesome-claude-code-subagents](https://github.com/VoltAgent/awesome-claude-code-subagents) — curated to work well with Gemma 4:9B (search, docs, process, coordination) |
| 2 custom sub-agents | `reality-checker` (project reality assessment) + `web-searcher` (Google/web search) |
| `litellm_config.example.yaml` | Template for the liteLLM proxy — copy to `litellm_config.yaml` and add your keys |
| `setup.ps1` | One-command env var configuration for the current terminal |
| `start-proxy.ps1` | Launches liteLLM (foreground or `-Background`) |
| `profile.ps1` | Snippet you can add to `$PROFILE` for permanent env vars |

## Prerequisites

- **PowerShell 7+** (or Windows PowerShell)
- **Python** with [litellm](https://github.com/BerriAI/litellm) installed: `pip install litellm`
- **Ollama** running locally with `gemma4:e4b` pulled (for sub-agents)
- **Claude Code** installed (`npm install -g @anthropic-ai/claude-code`)
- A **DeepSeek API key** (or swap the backend for any Anthropic-compatible provider)

## Installation

```powershell
# 1. Clone
git clone https://github.com/<your-username>/claude-code-workflow.git
cd claude-code-workflow

# 2. Configure liteLLM (add your API key)
cp litellm_config.example.yaml litellm_config.yaml
# Edit litellm_config.yaml → replace YOUR_DEEPSEEK_API_KEY

# 3. Install all 43 sub-agents globally (Gemma 4-safe)
.\install-agents.ps1

# 4. Start the proxy
.\start-proxy.ps1 -Background

# 5. Apply env vars (one-time per terminal, or add profile.ps1 to $PROFILE)
. .\setup.ps1

# 6. Run
claude
```

## Sub-agents

All 43 agents are installed to `~/.claude/agents/`, making them available in **every project**. Claude Code reads the `description` field of each agent and automatically spawns the right specialist for the task.

### Examples

| You say | Agent spawned |
|---|---|
| "Search for the latest React docs" | `web-searcher` |
| "Write the README for this project" | `readme-generator` |
| "Is this feature actually done?" | `reality-checker` |
| "Organize the project backlog" | `project-manager` or `scrum-master` |
| "Check this for accessibility issues" | `accessibility-tester` |
| "Write the changelog for v2.0" | `documentation-engineer` |

### Custom agents

**`reality-checker`** — Inspired by [karen.md](https://github.com/darcyegb/ClaudeCodeAgents/blob/master/karen.md). A no-nonsense project reality assessor that validates what's actually built vs. what's claimed, detects incomplete implementations, and creates pragmatic plans. Invoke it when you need an honest answer about project status.

**`web-searcher`** — Fast web search agent with `WebSearch` and `WebFetch` tools. The main agent automatically spawns this whenever it needs up-to-date information, documentation, or fact-checking. Uses Haiku model (routed to local Gemma) for quick, cheap searches.

## Environment variables

| Variable | Value | Purpose |
|---|---|---|
| `ANTHROPIC_BASE_URL` | `http://localhost:4000` | Points Claude Code to liteLLM |
| `ANTHROPIC_API_KEY` | `sk-ant-api03-litellmdummykey1234567890` | Dummy key — liteLLM ignores it |
| `ANTHROPIC_MODEL` | `claude-sonnet-4-5-20250929` | Model Claude Code requests (caught by liteLLM alias) |
| `CLAUDE_CODE_SUBAGENT_MODEL` | `claude-haiku-4-5-20251001` | Sub-agent model (caught by liteLLM alias) |
| `CLAUDE_CODE_EFFORT_LEVEL` | `max` | Reasoning effort for DeepSeek |

## Directory structure

```
claude-code-workflow/
├── awesome-claude-code-subagents/   ← cloned source repo (gitignored)
├── custom-agents/                   ← reality-checker + web-searcher
├── gemma-safe-agents.txt            ← which agents to install (curated for Gemma 4:9B)
├── litellm_config.example.yaml      ← template (no secrets)
├── litellm_config.yaml              ← your real config (gitignored)
├── setup.ps1                        ← sets env vars for current terminal
├── start-proxy.ps1                  ← starts liteLLM
├── profile.ps1                      ← env vars for $PROFILE
├── install-agents.ps1               ← installs only Gemma-safe agents
├── .gitignore
└── README.md
```

## Security

- `litellm_config.yaml` contains API keys — it's in `.gitignore`. Copy `litellm_config.example.yaml` and fill in your own keys.
- The `ANTHROPIC_API_KEY` env var is a **dummy value** — liteLLM doesn't validate it. Your real API key lives only in `litellm_config.yaml`.

## Customizing the backend

Want to use a different provider? Edit `litellm_config.yaml`:

```yaml
# Route main model to OpenAI instead
- model_name: claude-sonnet-4-5-20250929
  litellm_params:
    model: openai/gpt-4o
    api_key: YOUR_OPENAI_KEY
```

Any provider supported by [litellm](https://docs.litellm.ai/docs/providers) works — OpenAI, Anthropic, Groq, Together, etc.
