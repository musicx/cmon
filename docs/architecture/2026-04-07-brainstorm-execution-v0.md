# cmon Brainstorm Execution v0

Date: 2026-04-07
Status: Draft

This document turns `cmon:brainstorm` into a multi-role pre-implementation framing flow.

## 1. Purpose

`cmon:brainstorm` exists to decide what should be built before planning begins.

It should produce:

- one recommended direction
- explicit requirements and constraints
- clear scope boundaries
- a visible list of blockers if planning cannot start yet

## 2. Execution Stages

### Stage 1: Determine Brainstorm Scope

Start from:

- the task request
- the understand packet
- explicit operator controls when needed through `templates/brainstorm/brainstorm-run-manifest-template.md`

### Stage 2: Build Shared Brainstorm Context

Assemble:

- task summary
- existing artifacts and signals
- key tensions or ambiguities
- known constraints

Use:

- `templates/brainstorm/brainstorm-context-template.md`

### Stage 3: Dispatch Lens Brainstormers

Dispatch in parallel:

- `agents/brainstorm/product-brainstormer.md`
- `agents/brainstorm/engineer-brainstormer.md`
- `agents/brainstorm/ops-brainstormer.md`

Wrap each call with:

- `templates/brainstorm/lens-invocation-template.md`

### Stage 4: Synthesize

Pass the shared context and brainstormer outputs into:

- `agents/brainstorm/brainstorm-synthesizer.md`

Use:

- `templates/brainstorm/synthesizer-input-template.md`

### Stage 5: Write Or Update Requirements Artifact

If planning readiness is `ready`, write the result using:

- `templates/brainstorm/requirements-template.md`

Default target:

- `docs/brainstorms/`

Use `docs/architecture/` only when the problem is fundamentally architectural.

### Stage 6: Route To Next Skill

If blockers remain:

- stay in `cmon:brainstorm`

If blockers are resolved:

- move to `cmon:plan`

## 3. v0 Policy Choice

`cmon:brainstorm` is multi-lens, but still intentionally smaller than a full product strategy workshop.

It should:

- compare real options
- expose tradeoffs
- recommend one direction

It should not:

- write the implementation plan
- skip unresolved ambiguity
- silently collapse the operations lens

## 4. Why This Matches cmon

This keeps your preferred structure:

- role-separated observation in `understand`
- role-separated direction setting in `brainstorm`
- bounded execution later in `work`

So the strongest decisions happen before code starts.

## 5. Next Step

This execution doc now has a matching manual operating procedure:

- `docs/architecture/2026-04-07-brainstorm-operating-procedure-v0.md`

It is also exercised by this end-to-end example:

- `docs/architecture/2026-04-07-e2e-example-core-skill-routing-matrix.md`

The next useful upgrade after this document is:

- a second example where `cmon:brainstorm` exposes blocking ambiguity instead of planning readiness
