# Work Run Manifest

## Unit Identity

- Plan Path: `docs/plans/2026-04-07-core-skill-routing-matrix-plan.md`
- Unit ID Or Title: `Unit 1: Author routing matrix doc`
- Requirements Reference: `R1, R2, R3, R4, R5, R6`

## Unit Boundary

- Goal: create one compact operator-facing routing matrix for the canonical core `cmon:*` workflow skills
- Files In Scope:
  - `docs/architecture/2026-04-07-core-skill-routing-matrix-v0.md`
- Explicit Constraints:
  - preserve the canonical lifecycle order
  - do not invent new stage names or runtime concepts
- Out Of Scope:
  - cross-linking the new doc from every existing architecture file
  - rewriting the existing skill docs

## Verification Contract

- Verification Target:
  - manual line-by-line check against `AGENTS.md`, `core-skills-v0.md`, and the six skill docs
- Done Condition:
  - the matrix accurately reflects the six-skill lifecycle
  - the doc stays compact and operator-facing

## Stop Conditions

- if the lifecycle in source docs is inconsistent enough that the matrix cannot be written cleanly
- if the unit requires broad updates to multiple existing docs to remain truthful

## Execution State

- Status: `awaiting_verify`
- Notes:
  - scope stayed limited to the single target doc
