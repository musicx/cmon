# cmon Think Execution v0

Date: 2026-04-07
Status: Draft

This document describes the current internal execution layer for `cmon:think`.
It covers the shared multi-lens execution shape across `ideate`, `brainstorm`, and `fast-path`, while recognizing that v0 artifact support is strongest for requirements-oriented work.

## 1. Purpose

Historically this layer started as the execution surface for `cmon:brainstorm`.
It is now the canonical execution surface for `cmon:think`.

It should produce:

- one recommended direction or a ranked short list
- explicit requirements and constraints when the chosen mode needs them
- clear scope boundaries
- a visible list of blockers if design or planning cannot start yet

## 2. Execution Stages

### Stage 1: Determine Think Mode And Goal

Start from:

- the task request
- the understand packet
- explicit operator controls when needed through `templates/think/think-run-manifest-template.md`

Choose one mode:

- `ideate` when the user mainly needs grounded candidate directions
- `brainstorm` when a chosen direction still needs requirements clarification
- `fast-path` when clarity is already high and only a compact durable handoff is useful

### Stage 2: Build Shared Think Context

Assemble:

- task summary
- existing artifacts and signals
- key tensions or ambiguities
- known constraints

Use:

- `templates/think/think-context-template.md`

### Stage 3: Dispatch Lens Thinkers

Dispatch in parallel:

- `agents/think/product-thinker.md`
- `agents/think/engineer-thinker.md`
- `agents/think/ops-thinker.md`

Wrap each call with:

- `templates/think/lens-invocation-template.md`

### Stage 4: Synthesize

Pass the shared context and thinker outputs into:

- `agents/think/think-synthesizer.md`

Use:

- `templates/think/synthesizer-input-template.md`

### Stage 5: Write The Durable Artifact

If the chosen mode produces a durable ranked-direction artifact, write the result using:

- `templates/think/directions-template.md`

If the chosen mode produces approved requirements, write the result using:

- `templates/think/requirements-template.md`

Default target:

- `docs/brainstorms/`

Use `docs/architecture/` only when the problem is fundamentally architectural.

### Stage 6: Route To Next Skill

If blockers remain or the output is still a ranked option set:

- stay in `cmon:think`

If a design artifact is still needed:

- move to `cmon:design`

If blockers are resolved and design ambiguity is already low:

- move to `cmon:plan`

## 3. v0 Policy Choice

`cmon:think` is multi-lens, but still intentionally smaller than a full product strategy workshop or founder office-hours process.

It should:

- generate or compare grounded options
- expose tradeoffs
- recommend one direction or narrow the set

It should not:

- write the implementation plan
- skip unresolved ambiguity
- silently collapse the operations lens

## 4. Why This Matches cmon

This keeps your preferred structure:

- role-separated observation in `understand`
- role-separated direction setting in `think`
- bounded execution later in `work`

So the strongest decisions happen before code starts.

## 5. Next Step

This execution doc now has a matching manual operating procedure:

- `docs/architecture/2026-04-07-think-operating-procedure-v0.md`

It is also exercised by this end-to-end example:

- `docs/architecture/2026-04-07-e2e-example-core-skill-routing-matrix.md`

The next useful upgrade after this document is:

- a second example where `cmon:think` exposes blocking ambiguity instead of planning readiness
