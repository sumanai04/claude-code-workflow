<#
  Install Gemma 4-safe Claude Code sub-agents globally to ~/.claude/agents/
  Only installs agents that don't require deep reasoning (safe for Gemma 4:9B).
  Run once after cloning this repo.
#>

Write-Host "=== Installing Claude Code Sub-Agents (Gemma 4-safe) ===" -ForegroundColor Cyan

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$globalAgentsDir = "$env:USERPROFILE\.claude\agents"
$subagentsRepo = Join-Path $scriptDir "awesome-claude-code-subagents"
$customAgents = Join-Path $scriptDir "custom-agents"
$safeList = Join-Path $scriptDir "gemma-safe-agents.txt"

# Clone the subagents repo if not already present
if (-not (Test-Path $subagentsRepo)) {
    Write-Host "Cloning awesome-claude-code-subagents..." -ForegroundColor Yellow
    git clone https://github.com/VoltAgent/awesome-claude-code-subagents.git $subagentsRepo
} else {
    Write-Host "Subagents repo already cloned. Pulling latest..." -ForegroundColor Yellow
    Push-Location $subagentsRepo
    git pull 2>$null
    Pop-Location
}

# Create global agents directory
New-Item -ItemType Directory -Force -Path $globalAgentsDir | Out-Null

# Load the safe list
$safeAgents = Get-Content $safeList | Where-Object { $_ -notmatch '^#' -and $_ -ne '' } | ForEach-Object { $_.Trim() }

# Install VoltAgent sub-agents (only Gemma-safe ones)
$voltCount = 0
Get-ChildItem (Join-Path $subagentsRepo "categories") -Recurse -Filter "*.md" |
    Where-Object { $_.Name -ne "README.md" -and $safeAgents -contains $_.Name } |
    ForEach-Object {
        Copy-Item $_.FullName -Destination (Join-Path $globalAgentsDir $_.Name) -Force
        $voltCount++
    }

# Install custom agents
$customCount = 0
if (Test-Path $customAgents) {
    Get-ChildItem $customAgents -Filter "*.md" | ForEach-Object {
        Copy-Item $_.FullName -Destination (Join-Path $globalAgentsDir $_.Name) -Force
        $customCount++
    }
}

$total = $voltCount + $customCount
Write-Host "Installed $voltCount VoltAgent + $customCount custom = $total agents" -ForegroundColor Green
Write-Host "Agents globally available in: $globalAgentsDir" -ForegroundColor Green
Write-Host ""
Write-Host "These agents are selected to work well with Gemma 4:9B (local Ollama)." -ForegroundColor Yellow
Write-Host "They cover search, documentation, project management, and procedural tasks." -ForegroundColor Yellow
