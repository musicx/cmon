# cmon Project Guide

`cmon` is an opinionated harness skill repository for `Codex` and `Claude` first.

This project exists to combine the parts of existing harness systems that are most useful for this workspace:

- strict execution boundaries and implementation discipline
- mandatory pre-implementation thinking and planning
- multi-role review at key decision points
- deliberate knowledge capture so future work gets easier

It does **not** currently aim to be a general cross-host framework, a runtime-heavy delivery system, or a minimal "let the model figure it out" skill pack.

## Product Position

`cmon` should feel like:

- `superpowers` in execution discipline
- `compound-engineering` in planning, challenge/verification discipline, and knowledge compounding
- `gstack` in pre-implementation critique loops and design/plan quality gates
- a smaller, clearer, more directly composable system than either

`cmon` should **not** initially feel like:

- `gstack` with a large runtime layer, browser QA stack, or deploy chain
- `Waza` style minimal constraint / model-first freedom
- a general knowledge ingestion, research processing, or prose-polishing platform
- a generic plugin marketplace product

## Naming Convention

All user-facing core skill names must begin with the `cmon:` namespace.

Required initial skill names:

- `cmon:understand`
- `cmon:think`
- `cmon:design`
- `cmon:plan`
- `cmon:challenge`
- `cmon:work`
- `cmon:verify`
- `cmon:compound`

Supporting non-core workflow skills may also use the `cmon:` namespace when they help orchestrate the lifecycle without becoming new mandatory stages.

Current supporting skills:

- `cmon:debug`
- `cmon:refresh-knowledge`
- `cmon:revalidate`
- `cmon:worktree`

Deprecated compatibility alias:

- `cmon:brainstorm`
- `cmon:pressure-test`
- `cmon:review`

If repo-internal directories or files use filesystem-safe names without `:`, that is acceptable. The exported skill identity must still use the `cmon:` prefix.

## Founding Assumptions

These assumptions are project policy unless explicitly revised in a design doc.

1. **Multi-agent role separation is necessary**
   - Especially for repo understanding, pre-design thinking, multi-role challenge, and knowledge capture
   - At minimum, the system must support `product`, `engineering`, and `operations` viewpoints
   - This does **not** mean every stage uses symmetric parallel roles
   - Different stages may be multi-lens, owner-led, or engineering-owned depending on the decision being made

2. **Implementation must be tightly bounded**
   - Feature development needs explicit scope, constraints, files, verification, and exit criteria
   - Execution should not rely on broad agent improvisation

3. **Planning and compounding are first-class**
   - Work should not jump straight from request to implementation
   - Durable artifacts are required: requirements, design when needed, implementation plan, and knowledge capture when new learning is created

4. **Design is a distinct quality gate for non-trivial work**
   - Requirements answer what should exist
   - Design answers how the experience, flow, states, and boundaries should behave before implementation planning starts
   - Planning should not invent missing design decisions on the fly
   - Design is usually `owner-led`, not a three-way co-authoring stage

5. **Runtime-heavy orchestration is out of scope for v0**
   - No large local runtime, telemetry layer, browser stack, deploy pipeline, or update system unless later justified

6. **Model freedom is not a design goal right now**
   - We are intentionally choosing constraint over openness in early versions
   - If a future revision loosens constraints, that must be an explicit design decision

## Workflow Policy

For any non-trivial work inside `cmon`, prefer this lifecycle:

1. **`cmon:understand`**
   - Scan repo context, existing docs, and prior decisions
   - Use role-separated repo understanding where useful
   - Recover repo foundation state when it materially affects later routing
   - For greenfield or newly created project directories, if substantial tracked work is clearly about to begin and no git repo exists yet, initializing git during `understand` is acceptable

2. **`cmon:think`**
   - Unified pre-design thinking skill
   - Routes internally between:
     - `ideate` when the user needs candidate directions
     - `brainstorm` when the user needs requirements clarification for a chosen direction
     - `fast-path` when the request is already clear enough for quick routing
   - Include at least product, engineering, and operations lenses for meaningful work
   - Produce either a ranked option set or an approved requirements artifact, not an implementation sketch

3. **`cmon:design`**
   - Turn approved requirements into an explicit design artifact when flows, states, interfaces, UX, or architecture decisions would otherwise leak into planning
   - Make ambiguity visible before implementation planning starts
   - Treat design as mandatory, not optional, when any of these are true:
     - the work is a greenfield project or new product surface
     - the work introduces a user-facing CLI, API, UI, or operator surface
     - the work introduces persistent state, config, storage, or workflow modes
     - the work has multiple commands, workflows, states, or failure paths
   - Default to a clear owner:
     - `product-led` for user, UX, operator, and workflow design
     - `engineering-led` for architecture, interface, and system-boundary design
   - Other lenses challenge and constrain, but do not need to co-author in parallel by default

4. **`cmon:plan`**
   - Produce a technical plan with explicit boundaries and verification
   - Carry requirements and design decisions forward with traceability
   - This stage is normally `engineering-owned`

5. **`cmon:challenge`**
   - Run the explicit multi-role pre-work challenge on `design` / `plan` outputs before implementation starts

6. **`cmon:work`**
   - Implement only against approved scope
   - Keep tasks bounded and verifiable
   - This stage is explicitly `engineering-execution`, not multi-role co-execution
   - Before any actual development starts, confirm the target project area is already a git repo, or initialize it if the work is substantial greenfield project creation
   - For risky, parallel, or noisy workspaces, route through `cmon:worktree` before editing
   - For serial or parallel delegation, preserve explicit delegated sub-executor packets
   - Use lightweight checkpoints and simplification review rather than one long opaque execution burst

7. **`cmon:verify`**
   - Treat implementation as unaccepted until the code, plan alignment, and evidence package actually support the claim
   - This is the default post-work stage

8. **`cmon:compound`**
   - If the work produced new reusable knowledge, write it down in the project knowledge store

## Required Review Lenses

For substantial pre-work challenge, `cmon` should support at least these perspectives:

- **Product**
  - Did we solve the right problem?
  - Is scope right-sized?
  - Does the behavior match the intended user outcome?

- **Engineering**
  - Is the design coherent, testable, and maintainable?
  - Are the boundaries explicit and the implementation verifiable?

- **Operations**
  - What fails in production?
  - What breaks under misconfiguration, migration, retries, or partial rollout?

Additional lenses can be added later, but these three are mandatory in the project philosophy.

## Stage Ownership

`cmon` requires multi-role coverage across the workflow, but not the same collaboration pattern at every stage.

Quick heuristic:

- frame and accept with multiple lenses
- design with a clear owner
- plan with engineering ownership
- execute with engineering only, unless the unit hits a blocker or later review

- `cmon:understand`
  - often multi-lens, because context is easy to misread from only one viewpoint

- `cmon:brainstorm`
  - deprecated alias for `cmon:think`

- `cmon:think`
  - multi-lens by default
  - product, engineering, and operations should all shape problem framing and scope

- `cmon:design`
  - owner-led by default
  - `product-led` when the work is mainly about UX, operator flow, or experience design
  - `engineering-led` when the work is mainly about interfaces, system behavior, or architecture boundaries
  - non-owner lenses challenge, constrain, and review

- `cmon:plan`
  - engineering-owned
  - product and operations inputs are constraints, not co-equal plan authorship

- `cmon:challenge`
  - multi-lens by default
  - product, engineering, and operations should all challenge the proposed design / plan package before work begins

- `cmon:work`
  - engineering execution
  - other roles re-enter through challenge findings, blockers, or scope decisions

- `cmon:verify`
  - engineering acceptance by default
  - confirms implementation still matches approved design / plan and meets engineering quality expectations

- `cmon:compound`
  - multi-lens when the lesson has cross-role reuse value

Compact reference:

- `docs/architecture/2026-04-07-stage-ownership-routing-v0.md`

## Artifact Expectations

This repo should converge on a small set of durable artifact types:

- `docs/brainstorms/`
  - requirements, framing, scope, and chosen direction artifacts from `cmon:think`

- `docs/designs/`
  - design specs, user flows, states, interaction choices, and architecture-level design clarifications before planning

- `docs/plans/`
  - implementation plans and execution structure

- `docs/solutions/`
  - learned patterns, solved problems, guardrails, and recurring failure modes

- `docs/architecture/`
  - stable repo-level design docs when needed

Artifacts should use repo-relative paths only.

## Initial Non-Goals

Until explicitly approved in a design doc, do not treat these as part of v0:

- multi-host conversion for many agent platforms
- browser automation and visual QA stack
- deploy / canary / benchmark pipeline
- telemetry, self-update, or persistent runtime daemon
- maximizing model improvisation by minimizing constraints
- general URL/PDF reading, research collection, or writing-polish workflows that are not tightly in service of the engineering harness

## Decision Standard

When there is tension between speed and discipline, early `cmon` should bias toward discipline.

When there is tension between fewer artifacts and better future reuse, early `cmon` should bias toward reusable artifacts.

When there is tension between free-form execution and bounded execution, early `cmon` should bias toward bounded execution.

When there is tension between starting implementation faster and making design ambiguity explicit, early `cmon` should bias toward explicit design.

## Current Phase

This project is in **v1 dogfooding and operational validation**.

The immediate goal is to validate the existing workflow against real work without widening the system prematurely:

- use the current `cmon` chain on non-`cmon` tasks and capture friction precisely
- keep helper automation conditional on repeated manual pain rather than design ambition
- prefer small contract corrections over new stages, runtime layers, or orchestration surfaces
- keep improving knowledge maintenance only when real usage shows drift, overlap, or stale learnings

Current strategic follow-up:

- `docs/architecture/2026-04-07-next-opportunities-and-decisions-v0.md`
