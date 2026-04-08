# Work Run Manifest

## Unit Identity

- Plan Path: `docs/plans/2026-04-07-proof-coverage-scope-expansion-plan.md`
- Requirements Path: `docs/brainstorms/2026-04-07-proof-coverage-scope-expansion-requirements.md`
- Design Path: `docs/designs/2026-04-07-proof-coverage-scope-expansion-design.md`
- Unit ID Or Title: `Unit 1: Add the proof-coverage reference and surface it from the architecture summary`

## Unit Boundary

- Goal: add a compact workflow proof-coverage reference and surface it from the architecture summary layer
- Patterns To Follow:
  - `docs/architecture/2026-04-07-stage-ownership-routing-v0.md`
  - `docs/solutions/workflow/operator-facing-routing-matrix-for-core-skills-2026-04-07.md`
- Files In Scope:
  - `docs/architecture/2026-04-07-workflow-proof-coverage-v0.md`
  - `docs/architecture/2026-04-07-core-skills-v0.md`
- Explicit Constraints:
  - do not rewrite every historical follow-up note
  - stop if backlog truth contradicts the new proof reference
- Execution Note:
  - `none`
- Out Of Scope:
  - broad backlog cleanup
  - blocked example work

## Verification Contract

- Execution Strategy: `inline`
- Verification Target:
  - cross-check the new proof-coverage reference against the existing example docs and current summary docs

## Stop Conditions

- if a backlog or work-summary doc must change to keep proof status truthful, record a scope-expansion request before continuing

## Execution State

- Status: `in_progress`
