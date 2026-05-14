<#
  Install all 146 Claude Code sub-agents globally to ~/.claude/agents/
  Run once after cloning this repo.
#>

Write-Host "=== Installing Claude Code Sub-Agents ===" -ForegroundColor Cyan

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$globalAgentsDir = "$env:USERPROFILE\.claude\agents"
$subagentsRepo = Join-Path $scriptDir "awesome-claude-code-subagents"
$customAgents = Join-Path $scriptDir "custom-agents"

# Clone the subagents repo if not already present
if (-not (Test-Path $subagentsRepo)) {
    Write-Host "Cloning awesome-claude-code-subagents..." -ForegroundColor Yellow
    git clone https://github.com/VoltAgent/awesome-claude-code-subagents.git $subagentsRepo
} else {
    Write-Host "Subagents repo already cloned. Pulling latest..." -ForegroundColor Yellow
    Push-Location $subagentsRepo
    git pull
    Pop-Location
}

# Create global agents directory
New-Item -ItemType Directory -Force -Path $globalAgentsDir | Out-Null

# Install VoltAgent sub-agents (skip README.md files)
$voltCount = 0
Get-ChildItem (Join-Path $subagentsRepo "categories") -Recurse -Filter "*.md" |
    Where-Object { $_.Name -ne "README.md" } |
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

Write-Host "Installed $voltCount VoltAgent agents + $customCount custom agents = $($voltCount + $customCount) total" -ForegroundColor Green
Write-Host "Agents are globally available in: $globalAgentsDir" -ForegroundColor Green
Write-Host "Run 'claude' in any project and they will be auto-detected." -ForegroundColor Yellow
