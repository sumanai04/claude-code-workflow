<#
  Claude Code Workflow Setup
  Run this in any PowerShell session to configure Claude Code with liteLLM proxy
  Usage: . .\setup.ps1
#>

Write-Host "=== Claude Code Workflow Setup ===" -ForegroundColor Cyan

# --- Model routing: main model goes to DeepSeek, subagents to local Gemma ---
$env:ANTHROPIC_BASE_URL  = "http://localhost:4000"
$env:ANTHROPIC_API_KEY   = "sk-ant-api03-litellmdummykey1234567890"

# When Claude Code spawns a subagent, it requests this model
$env:CLAUDE_CODE_SUBAGENT_MODEL = "claude-haiku-4-5-20251001"

# Main conversation model
$env:ANTHROPIC_MODEL = "claude-sonnet-4-5-20250929"

$env:CLAUDE_CODE_EFFORT_LEVEL = "max"

Write-Host "Environment variables set:" -ForegroundColor Green
Write-Host "  ANTHROPIC_BASE_URL        = $env:ANTHROPIC_BASE_URL"
Write-Host "  ANTHROPIC_MODEL           = $env:ANTHROPIC_MODEL"
Write-Host "  CLAUDE_CODE_SUBAGENT_MODEL = $env:CLAUDE_CODE_SUBAGENT_MODEL"
Write-Host "  CLAUDE_CODE_EFFORT_LEVEL  = $env:CLAUDE_CODE_EFFORT_LEVEL"
Write-Host ""
Write-Host "Agents installed: $((Get-ChildItem "$env:USERPROFILE\.claude\agents" -Filter '*.md').Count) globally available"
Write-Host ""
Write-Host "Next: run 'claude' in any project directory" -ForegroundColor Yellow
