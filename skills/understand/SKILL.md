---
name: cmon:understand
description: Use at the start of non-trivial work to recover the exact repo context packet later stages should rely on before thinking, design, planning, or review.
---

# cmon:understand

Recover the verified context packet required to work responsibly in this repo.

This is an orchestrator skill when the task is substantial.

This skill exists to prevent four common failures:

- solving the wrong problem because prior decisions were missed
- planning against imagined repo structure instead of actual structure
- repeating already-solved work because prior plans or solutions were not consulted
- letting each later stage rediscover different partial context and drift apart

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
2. Existing durable artifacts that matter
3. Local patterns and neighboring implementation surfaces
4. Known constraints from `AGENTS.md`, `README.md`, and nearby docs
5. Prior learnings or solution docs worth reusing
6. Open uncertainties that still need clarification
7. A next-stage routing recommendation with justification
8. Packet readiness notes describing what the next stage must treat as fixed vs unresolved

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

Recover prior knowledge explicitly:

- solution or pattern docs that already cover the topic
- prior brainstorms, designs, or plans that should shape the next stage
- repo-local patterns the next stage should follow instead of reinventing

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

### Stage 5: Validate the packet

Before handoff, verify the packet is strong enough for the next stage:

- the relevant repo area is verified rather than guessed
- the strongest prior artifacts are named
- the most relevant local patterns are called out
- the next stage's biggest unknowns are explicit
- the route to the next skill is justified

## Output Format

Keep the result short and structured.

Recommended sections:

- `Relevant area`
- `Existing artifacts`
- `Prior learnings`
- `Local patterns`
- `Constraints`
- `Open questions`
- `Packet readiness`
- `Recommended next step`

## Hard Rules

- Do not invent repo structure that you did not verify
- Do not skip prior docs if they clearly match the task
- Do not jump into implementation from this skill
- Do not collapse product, engineering, and operations observations into one unlabeled blob when the multi-lens pipeline is available
- Do not produce a packet that names paths but fails to explain why the next stage should care
- Do not treat `cmon:understand` as optional when the task is substantial and repo familiarity is low

## Handoff

Typical next steps:

- `cmon:think` if the problem, direction, or scope is still open
- `cmon:design` if requirements are already clear but flow, state, or interface behavior still needs explicit design
- `cmon:plan` if the requirements and design are already clear enough
- `cmon:review` if the task is to assess an existing change

Later stages should treat the context packet as the shared starting point rather than silently rebuilding incompatible context from scratch.
