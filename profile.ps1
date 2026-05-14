<#
  Add this snippet to your PowerShell profile to make Claude Code workflow
  available in every terminal session.

  To install, run:
    Add-Content -Path $PROFILE -Value (Get-Content (Join-Path $PSScriptRoot profile.ps1) -Raw)

  Or manually add this file's content to:
    $PROFILE
#>

# --- Claude Code Workflow (auto-generated) ---
$env:ANTHROPIC_BASE_URL  = "http://localhost:4000"
$env:ANTHROPIC_API_KEY   = "sk-ant-api03-litellmdummykey1234567890"
$env:CLAUDE_CODE_SUBAGENT_MODEL = "claude-haiku-4-5-20251001"
$env:ANTHROPIC_MODEL = "claude-sonnet-4-5-20250929"
$env:CLAUDE_CODE_EFFORT_LEVEL = "max"
