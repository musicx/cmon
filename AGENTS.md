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
- `compound-engineering` in planning, review, and knowledge compounding
- a smaller, clearer, more directly composable system than either

`cmon` should **not** initially feel like:

- `gstack` with a large runtime layer, browser QA stack, or deploy chain
- `Waza` style minimal constraint / model-first freedom
- a generic plugin marketplace product

## Naming Convention

All user-facing core skill names must begin with the `cmon:` namespace.

Required initial skill names:

- `cmon:understand`
- `cmon:brainstorm`
- `cmon:plan`
- `cmon:work`
- `cmon:review`
- `cmon:compound`

If repo-internal directories or files use filesystem-safe names without `:`, that is acceptable. The exported skill identity must still use the `cmon:` prefix.

## Founding Assumptions

These assumptions are project policy unless explicitly revised in a design doc.

1. **Multi-agent role separation is necessary**
   - Especially for repo understanding, brainstorming, review, and knowledge capture
   - At minimum, the system must support `product`, `engineering`, and `operations` viewpoints

2. **Implementation must be tightly bounded**
   - Feature development needs explicit scope, constraints, files, verification, and exit criteria
   - Execution should not rely on broad agent improvisation

3. **Planning and compounding are first-class**
   - Work should not jump straight from request to implementation
   - Durable artifacts are required: requirements/design, implementation plan, and knowledge capture when new learning is created

4. **Runtime-heavy orchestration is out of scope for v0**
   - No large local runtime, telemetry layer, browser stack, deploy pipeline, or update system unless later justified

5. **Model freedom is not a design goal right now**
   - We are intentionally choosing constraint over openness in early versions
   - If a future revision loosens constraints, that must be an explicit design decision

## Workflow Policy

For any non-trivial work inside `cmon`, prefer this lifecycle:

1. **`cmon:understand`**
   - Scan repo context, existing docs, and prior decisions
   - Use role-separated repo understanding where useful

2. **`cmon:brainstorm`**
   - Clarify the problem, tradeoffs, and scope
   - Include at least product, engineering, and operations lenses for meaningful work

3. **Design / Requirements**
   - Write a durable artifact describing what should be built and what is out of scope

4. **`cmon:plan`**
   - Produce a technical plan with explicit boundaries and verification

5. **`cmon:work`**
   - Implement only against approved scope
   - Keep tasks bounded and verifiable

6. **`cmon:review`**
   - Review through multiple lenses, not just correctness
   - Product fit, engineering quality, and operational safety all matter

7. **`cmon:compound`**
   - If the work produced new reusable knowledge, write it down in the project knowledge store

## Required Review Lenses

For substantial work, `cmon` should eventually support at least these review perspectives:

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

## Artifact Expectations

This repo should converge on a small set of durable artifact types:

- `docs/brainstorms/`
  - requirements, framing, scope, decisions before planning

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

## Decision Standard

When there is tension between speed and discipline, early `cmon` should bias toward discipline.

When there is tension between fewer artifacts and better future reuse, early `cmon` should bias toward reusable artifacts.

When there is tension between free-form execution and bounded execution, early `cmon` should bias toward bounded execution.

## Current Phase

This project is in **foundation design**.

The immediate goal is to define:

- the repo structure
- the core workflow
- the initial role model
- the artifact model
- the first batch of skills and agent prompts for `Codex` and `Claude`

Implementation should follow the design documents in `docs/` as they are created and approved.
