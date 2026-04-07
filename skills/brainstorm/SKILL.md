---
name: cmon:brainstorm
description: Use before non-trivial implementation to clarify the problem, compare approaches, and produce an approved requirements artifact through product, engineering, and operations lenses.
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
- whether there is enough clarity to move into explicit design or directly into planning

## Hard Gate

Do not move to implementation from this skill.

The only valid next step after a successful brainstorm is:

- writing or updating the requirements artifact
- then handing off to `cmon:design` or `cmon:plan`

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
- no additional design clarification is needed

## Core Contract

`cmon:brainstorm` answers:

- what should exist
- why it matters
- what is in and out of scope
- which approach is preferred and why

It does not answer:

- exact file structure
- implementation sequence
- detailed technical design
- how work units will be executed

## Workflow

### Stage 0: Assess whether brainstorming is needed

Before going deep, decide whether the request already contains:

- concrete expected behavior
- explicit scope limits
- success criteria

If yes, keep this pass compact and write only the minimum durable artifact needed for handoff.

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

### Stage 4: Pressure-test and synthesize the direction

Pass the shared context and brainstorm outputs into:

- `agents/brainstorm/brainstorm-synthesizer.md`

Use `templates/brainstorm/synthesizer-input-template.md` as the default synthesis structure.

When meaningful alternatives exist, the synthesized result should explicitly compare 2-3 approaches and recommend one.

### Stage 5: Write the durable artifact

If planning readiness is clear, write or update the requirements artifact.

### Stage 6: Get approval before handoff

## Required Artifact

Write the result to:

- `docs/brainstorms/` for exploratory or scope-shaping work

Use `templates/brainstorm/requirements-template.md` as the default structure unless the work is so small that a compact variant is clearly better.

The artifact must include:

- problem frame
- intended behavior
- alternatives and recommendation when the choice is real
- scope boundaries
- success criteria
- key decisions
- unresolved blockers

## Hard Rules

- No coding
- No exact file layout, implementation sequencing, or shell choreography
- No silent collapse of product questions into engineering assumptions
- No skipping the operations viewpoint on meaningful changes
- No default inclusion of libraries, schemas, endpoints, or code structure unless the brainstorm is itself about an architectural decision
- No transition to `cmon:plan` while `Resolve Before Planning` still contains blocking ambiguity

## Handoff

If approved:

- move to `cmon:design` when flows, states, interfaces, or cross-surface behavior still need explicit design work
- otherwise move to `cmon:plan`

If not approved:

- revise the requirements artifact and continue brainstorming
