# cmon

`cmon` is an opinionated harness skill repository for `Codex` and `Claude` first.

It is designed for engineering workflow discipline rather than runtime orchestration.

Core goals:

- force explicit thinking, design, planning, challenge, work, and verification boundaries
- keep implementation bounded and evidence-backed
- preserve reusable knowledge without turning the repo into a general research platform
- support live local skill development through Codex wrapper installs

## Canonical Workflow

For substantial work, the default chain is:

```text
cmon:understand -> cmon:think -> cmon:design -> cmon:challenge(mode=design) -> human_design_approval -> cmon:plan -> cmon:challenge(mode=package) -> human_package_approval -> cmon:work -> cmon:verify -> cmon:compound
```

Highlights:

- `cmon:design` is mandatory for greenfield, user-facing, stateful, or multi-workflow work
- `cmon:challenge(mode=design)` challenges the design before human design approval
- `cmon:plan` produces both a Markdown implementation plan and a required execution JSON graph
- `cmon:challenge(mode=package)` challenges approved design, plan, and execution JSON before human package approval
- `cmon:work` executes only bounded units
- `cmon:work` tracks progress against the approved execution JSON
- `cmon:verify` is the default post-work engineering acceptance stage

## Core Skills

- `cmon:understand`
- `cmon:think`
- `cmon:design`
- `cmon:plan`
- `cmon:challenge`
- `cmon:work`
- `cmon:verify`
- `cmon:compound`

Supporting skills:

- `cmon:debug`
- `cmon:refresh-knowledge`
- `cmon:revalidate`
- `cmon:worktree`

Deprecated aliases kept for compatibility:

- `cmon:brainstorm`
- `cmon:pressure-test`
- `cmon:review`

## Repo Layout

- [AGENTS.md](/Users/ericliu/Code/projects/cmon/AGENTS.md)
  Project policy and workflow contract.
- [skills/](/Users/ericliu/Code/projects/cmon/skills)
  Canonical skill source.
- [agents/](/Users/ericliu/Code/projects/cmon/agents)
  Role prompts used by multi-lens stages.
- [templates/](/Users/ericliu/Code/projects/cmon/templates)
  Durable artifact and invocation templates.
- [docs/architecture/](/Users/ericliu/Code/projects/cmon/docs/architecture)
  Architecture notes, comparisons, execution docs, and benchmark decisions.
- [docs/approvals/](/Users/ericliu/Code/projects/cmon/docs/approvals)
  Human design and package approval artifacts.
- [scripts/](/Users/ericliu/Code/projects/cmon/scripts)
  Lightweight local-dev helpers, including Codex live install.

## Local Codex Install

`cmon` uses a live-wrapper model:

- one vendor link into Codex-managed storage
- one thin installed wrapper per skill
- canonical skill content stays in this repo

That means you edit `cmon` in place, then restart Codex to pick up changes.

macOS / Linux:

```bash
python3 scripts/link_codex_skills.py install
python3 scripts/link_codex_skills.py status
```

Windows PowerShell:

```powershell
./scripts/link_codex_skills.ps1 install
./scripts/link_codex_skills.ps1 status
```

More detail:

- [local-codex-install-v0.md](/Users/ericliu/Code/projects/cmon/docs/architecture/2026-04-07-local-codex-install-v0.md)

## Current Status

`cmon` is in v1 dogfooding and operational validation.

The current priority is not to widen the framework, but to:

- use it on real projects
- capture friction precisely
- tighten contracts where dogfooding exposes ambiguity

## Non-Goals

`cmon` is intentionally not:

- a runtime-heavy orchestrator
- a delivery / deploy platform
- a browser QA stack
- a general research ingestion or prose-polishing system
- a marketplace-style skill product
