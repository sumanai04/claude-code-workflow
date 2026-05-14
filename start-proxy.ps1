<#
  Start liteLLM proxy for Claude Code model routing.
  Usage: .\start-proxy.ps1 [-Background]
#>

param(
    [switch]$Background
)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

if ($Background) {
    Write-Host "Starting liteLLM proxy in background on :4000..." -ForegroundColor Cyan
    Start-Process -NoNewWindow -FilePath "litellm" -ArgumentList "--config `"$scriptDir\litellm_config.yaml`" --port 4000"
    Write-Host "Proxy started. Check with: netstat -ano | findstr ':4000'" -ForegroundColor Green
} else {
    Write-Host "Starting liteLLM on :4000..." -ForegroundColor Cyan
    litellm --config "$scriptDir\litellm_config.yaml" --port 4000
}
