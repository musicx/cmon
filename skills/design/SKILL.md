---
name: cmon:design
description: Use after approved requirements when non-trivial flows, states, interfaces, UX, or architecture decisions need to be made explicit before implementation planning.
---

# cmon:design

Make the intended design explicit before planning starts.

`cmon:design` exists because requirements and plans are not enough on their own:

- requirements say what should happen
- plans say how code will be organized and executed
- design says how the behavior, flow, states, and boundaries should actually work

This skill is where `cmon` absorbs the strongest pre-implementation design bar from `gstack` without importing its runtime stack.

This stage is owner-led by default.

- `product-led` when the work is mainly about user flow, operator flow, UX, or behavior
- `engineering-led` when the work is mainly about interfaces, architecture, protocol, or system-boundary behavior

Other lenses challenge and constrain the design when needed, but they do not need to co-author parallel drafts by default.

The canonical execution shape is now:

1. owner draft
2. non-owner challenge
3. synthesized challenge decision
4. revision or approval

When an `understand` packet exists, use it as the verified entry context for:

- relevant repo area
- prior artifacts
- reusable local patterns
- constraints and unresolved unknowns

## When to Use

Use this skill when any of these are true:

- the work is a greenfield project or new product surface
- the work introduces a user-facing CLI, API, UI, or operator surface
- the work introduces persistent state, config, storage, or workflow modes
- the work has multiple commands, workflows, states, or failure paths
- the work introduces a non-trivial user or operator flow
- the work has multiple important states such as loading, empty, partial success, error, or retry
- interfaces or system boundaries need to be defined before planning
- architecture choices materially affect user-visible behavior
- the plan would otherwise have to invent missing design decisions

Skip this skill only when all of these are true:

- the change is tightly bounded
- the work is not a greenfield or newly introduced product surface
- no new user-facing surface, persistent state, config surface, or multi-mode workflow is being introduced
- no meaningful flow or state design is being introduced
- requirements are already specific enough that planning would not need to invent behavior

## Hard Gate

Do not implement from this skill.

Do not use this skill to write the implementation plan.

The only normal next step is:

- write or update the design artifact
- then move to `cmon:plan`

## Core Contract

`cmon:design` answers:

- what the user or operator sees in each relevant state
- how the flow moves from step to step
- where boundaries and interfaces sit
- which ambiguities must be resolved before planning

It does not answer:

- exact files to edit
- commit sequencing
- test command choreography
- production code shape

## Ownership Model

Use one clear owner for the design artifact.

The owner is responsible for:

- drafting the design
- deciding what ambiguity must be removed before planning
- incorporating relevant challenge from other lenses
- consuming the current `understand` packet rather than rediscovering upstream context ad hoc

Non-owner lenses are responsible for:

- surfacing risks
- challenging weak assumptions
- forcing clarity where the draft would otherwise create downstream implementation churn

## Required Artifact

Write the result to:

- `docs/designs/` for product, interaction, or operator-facing design specs
- `docs/architecture/` only when the design decision is primarily architectural and repo-level

Use `templates/design/design-spec-template.md` as the default structure.
Use `templates/design/design-run-manifest-template.md` when owner mode or challenge scope should be explicit before drafting starts.

The artifact must include:

- design goals
- requirements trace
- user or system flow
- important states and failure handling
- interface and boundary decisions
- unresolved design blockers

## Quality Gate

Before handing off to `cmon:plan`, review the artifact against these dimensions:

- flow clarity
- state completeness
- boundary clarity
- user or operator experience clarity
- operability and failure realism
- ambiguity left for the implementer

If any dimension is materially weak, revise the design artifact before planning.

The v0 challenge flow uses:

- `templates/design/challenge-invocation-template.md`
- `templates/design/design-synthesizer-input-template.md`
- `agents/design/product-challenger.md`
- `agents/design/engineering-challenger.md`
- `agents/design/ops-challenger.md`
- `agents/design/design-synthesizer.md`

## Hard Rules

- No implementation plan in disguise
- No exact file map or execution sequence
- No unresolved design ambiguity pushed downstream when it changes implementation shape
- No generic phrases such as "clean UI" or "handle errors gracefully" without explicit design meaning

## Handoff

Record the handoff using:

- `templates/workflow/stage-transition-decision-template.md`

If approved and non-blocking:

- `proceed -> cmon:plan`

If not:

- `revise -> cmon:design`
- revise the design artifact and continue design work

If upstream requirements or task framing instability prevent responsible design closure:

- `block`

The operational execution and manual procedure are documented in:

- `docs/architecture/2026-04-07-design-execution-v0.md`
- `docs/architecture/2026-04-07-design-operating-procedure-v0.md`
