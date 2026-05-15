# CLAUDE.md — Sub-Agent Delegation Rules

You have 43 specialized sub-agents available. **ALWAYS delegate** — never do manually what a sub-agent can do for you. Before starting any task, ask: "Is there a sub-agent for this?"

## Mandatory Delegation Rules

### ALWAYS delegate web searches
Every time you need up-to-date information, documentation, or fact-checking, you MUST spawn the sub-agent:
- **web-searcher** — any internet search, current docs, error lookups, library research
- **search-specialist** — complex multi-source searches requiring strategy
- **data-researcher** — discovering datasets, data collection, validation
- **market-researcher** — market analysis, competitive landscapes, consumer behavior
- **research-analyst** — comprehensive multi-source research with synthesis
- **scientific-literature-researcher** — academic papers, studies, experimental data
- **trend-analyst** — emerging patterns, industry predictions, scenario planning

### ALWAYS delegate documentation tasks
- **readme-generator** — README files built from actual repo reality
- **documentation-engineer** — API docs, tutorials, guides, documentation systems
- **api-documenter** — OpenAPI specs, interactive documentation portals
- **technical-writer** — technical docs, API references, getting-started guides

### ALWAYS delegate project/process management
- **project-manager** — project plans, risk management, stakeholder coordination
- **scrum-master** — sprint planning, retrospectives, agile ceremonies
- **product-manager** — feature prioritization, roadmap, product strategy
- **business-analyst** — requirements gathering, process improvement, stakeholder analysis
- **project-idea-validator** — idea validation, competitor analysis, go/no-go assessment

### ALWAYS delegate when checking project status
- **reality-checker** — honest assessment of what's actually built vs claimed, incomplete implementations, pragmatic completion plans

### ALWAYS delegate code quality and compliance checks
- **accessibility-tester** — WCAG compliance, assistive technology assessment
- **compliance-auditor** — regulatory compliance (GDPR, HIPAA, PCI, SOC 2, ISO)
- **dx-optimizer** — developer workflow optimization, build times, testing efficiency

### ALWAYS delegate git and build tasks
- **git-workflow-manager** — branching strategies, merge management, git workflows
- **build-engineer** — build performance, compilation times, build system scaling
- **dependency-manager** — dependency audits, vulnerability checks, bundle optimization
- **cli-developer** — CLI tools, terminal applications, command design
- **tooling-engineer** — developer tools, code generators, IDE extensions

### ALWAYS delegate business and content tasks
- **content-marketer** — content strategy, SEO content, multi-channel campaigns
- **customer-success-manager** — customer health, retention strategies, churn prevention
- **sales-engineer** — technical pre-sales, solution architecture, proof-of-concept
- **legal-advisor** — contract drafting, compliance requirements, IP protection
- **license-engineer** — OSI licensing, dependency compliance, proprietary deployment
- **seo-specialist** — technical SEO audits, keyword strategy, search optimization
- **ux-researcher** — user research, usability testing, persona development

### ALWAYS delegate agent coordination
- **task-distributor** — distributing work across multiple agents, queue management
- **workflow-orchestrator** — business process workflows, error handling, state management
- **agent-installer** — discovering and installing new sub-agents
- **agent-organizer** — assembling multi-agent teams, task decomposition
- **context-manager** — shared state, information retrieval across agents

### Other specialized agents
- **knowledge-synthesizer** — extracting patterns from agent interactions, organizational learning
- **legacy-modernizer** — legacy system migration, technical debt reduction
- **m365-admin** — Microsoft 365 administration, Exchange, Teams, SharePoint
- **mcp-developer** — Model Context Protocol servers and clients
- **risk-manager** — enterprise risk identification, quantification, mitigation
- **wordpress-master** — WordPress architecture, optimization, security

## How to invoke
Use `/agents <name> "<task>"` or the agent tool with the agent name and task description.

## Iron rule
**Never do work yourself that a sub-agent is designed to handle.** Check the list above before every action.
