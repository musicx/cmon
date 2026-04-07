---
name: cmon:understand
description: Use at the start of non-trivial work to recover repo context, prior decisions, constraints, and relevant existing patterns before brainstorming, planning, or reviewing.
---

# cmon:understand

Recover the minimum context required to work responsibly in this repo.

This is an orchestrator skill when the task is substantial.

This skill exists to prevent three common failures:

- solving the wrong problem because prior decisions were missed
- planning against imagined repo structure instead of actual structure
- repeating already-solved work because prior plans or solutions were not consulted

## When to Use

Use this skill when:

- starting a new feature or substantial change
- resuming work after a break
- reviewing a change that depends on prior decisions
- planning work in an unfamiliar area of the repo

Do not use this skill as a substitute for implementation or review. It produces context, not code.

## Required Outputs

Produce a concise context packet containing:

1. The relevant area of the repo
2. Existing docs or artifacts that matter
3. Known constraints from `AGENTS.md`, `README.md`, and nearby docs
4. Similar patterns or prior implementations
5. Open uncertainties that still need clarification

Use `templates/understand/understand-context-template.md` as the default shared context shape.

## Workflow

### Stage 1: Determine scope

Start from:

- the task request
- explicit paths if provided
- `templates/understand/understand-run-manifest-template.md` when operator control is needed

### Stage 2: Gather shared context

Read local instructions and relevant artifacts first:

- `AGENTS.md`
- relevant docs in `docs/`
- prior durable artifacts in:
  - `docs/brainstorms/`
  - `docs/plans/`
  - `docs/solutions/`
  - `docs/architecture/`

Inspect the relevant code area:

- entry points
- neighboring modules
- nearby tests

### Stage 3: Dispatch lens observers

Dispatch in parallel:

- `agents/understand/product-observer.md`
- `agents/understand/engineer-observer.md`
- `agents/understand/ops-observer.md`

Use `templates/understand/lens-invocation-template.md` as the default wrapper for each observer call.

### Stage 4: Synthesize

Pass the shared context and observer outputs into:

- `agents/understand/understand-synthesizer.md`

Use `templates/understand/synthesizer-input-template.md` as the default synthesis structure.

## Output Format

Keep the result short and structured.

Recommended sections:

- `Relevant area`
- `Existing artifacts`
- `Local patterns`
- `Constraints`
- `Open questions`

## Hard Rules

- Do not invent repo structure that you did not verify
- Do not skip prior docs if they clearly match the task
- Do not jump into implementation from this skill
- Do not collapse product, engineering, and operations observations into one unlabeled blob when the multi-lens pipeline is available

## Handoff

Typical next steps:

- `cmon:think` if the problem, direction, or scope is still open
- `cmon:plan` if the requirements are already clear
- `cmon:review` if the task is to assess an existing change
