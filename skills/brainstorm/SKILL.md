---
name: cmon:brainstorm
description: Use before non-trivial implementation to clarify the problem, compare approaches, and produce an approved requirements or design artifact through product, engineering, and operations lenses.
---

# cmon:brainstorm

Clarify what should be built before code is written.

This is an orchestrator skill for meaningful pre-implementation framing.

This skill is mandatory for non-trivial feature work unless the request is already precise enough to plan directly.

`cmon:brainstorm` is where `cmon` decides:

- what problem is actually being solved
- whether the requested scope is right-sized
- what tradeoffs matter
- what product, engineering, and operations each think about the change

## Hard Gate

Do not move to implementation from this skill.

The only valid next step after a successful brainstorm is:

- writing or updating the requirements/design artifact
- then handing off to `cmon:plan`

## Required Lenses

Every meaningful brainstorm must explicitly examine:

- `Product`
  - Is this the right problem?
  - Is scope too wide or too narrow?

- `Engineering`
  - Is the shape understandable and implementable?
  - Where are the interface and complexity risks?

- `Operations`
  - What assumptions fail in rollout, configuration, migration, retries, or partial failure?

## When to Use

Use this skill when:

- a feature idea is still vague
- multiple approaches are plausible
- the request needs scope shaping
- the problem sounds larger than the first phrasing suggests

Skip to `cmon:plan` only when:

- intended behavior is already clear
- scope boundaries are already explicit
- success criteria are already concrete

## Workflow

### Stage 1: Recover context

Run `cmon:understand` or recover equivalent context.

If operator control is needed, start from:

- `templates/brainstorm/brainstorm-run-manifest-template.md`

### Stage 2: Build shared brainstorm context

Assemble the shared bundle using:

- `templates/brainstorm/brainstorm-context-template.md`

### Stage 3: Dispatch lens brainstormers

Dispatch in parallel:

- `agents/brainstorm/product-brainstormer.md`
- `agents/brainstorm/engineer-brainstormer.md`
- `agents/brainstorm/ops-brainstormer.md`

Use `templates/brainstorm/lens-invocation-template.md` as the default wrapper for each brainstorm call.

### Stage 4: Synthesize the direction

Pass the shared context and brainstorm outputs into:

- `agents/brainstorm/brainstorm-synthesizer.md`

Use `templates/brainstorm/synthesizer-input-template.md` as the default synthesis structure.

### Stage 5: Write the durable artifact

If planning readiness is clear, write or update the requirements/design artifact.

### Stage 6: Get approval before handoff

## Required Artifact

Write the result to:

- `docs/brainstorms/` for exploratory or scope-shaping work
- `docs/architecture/` only if the brainstorm is fundamentally architectural

Use `templates/brainstorm/requirements-template.md` as the default structure unless the work is so small that a compact variant is clearly better.

The artifact must include:

- problem frame
- intended behavior
- scope boundaries
- success criteria
- key decisions
- unresolved blockers

## Hard Rules

- No coding
- No pseudo-implementation steps
- No silent collapse of product questions into engineering assumptions
- No skipping the operations viewpoint on meaningful changes
- No transition to `cmon:plan` while `Resolve Before Planning` still contains blocking ambiguity

## Handoff

If approved:

- move to `cmon:plan`

If not approved:

- revise the requirements/design artifact and continue brainstorming
