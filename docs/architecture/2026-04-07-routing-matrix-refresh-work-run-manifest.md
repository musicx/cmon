# Work Run Manifest

## Unit Identity

- Plan Path: `docs/plans/2026-04-07-routing-matrix-refresh-plan.md`
- Requirements Path: `docs/brainstorms/2026-04-07-routing-matrix-refresh-requirements.md`
- Design Path: `docs/designs/2026-04-07-routing-matrix-refresh-design.md`
- Unit ID Or Title: `Unit 1: Refresh operator-facing workflow surfaces`
- Requirements Reference: `R1, R2, R3, R4, R5, R6, R7`

## Unit Boundary

- Goal: refresh the routing matrix, reusable workflow pattern doc, and richer example summary so all operator-facing workflow surfaces reflect the current `plan` and `work` contracts
- Patterns To Follow:
  - `docs/architecture/2026-04-07-core-skill-routing-matrix-v0.md`
  - `docs/solutions/workflow/operator-facing-routing-matrix-for-core-skills-2026-04-07.md`
- Files In Scope:
  - `docs/architecture/2026-04-07-core-skill-routing-matrix-v0.md`
  - `docs/solutions/workflow/operator-facing-routing-matrix-for-core-skills-2026-04-07.md`
  - `docs/architecture/2026-04-07-e2e-example-routing-matrix-refresh-v1.md`
- Explicit Constraints:
  - keep lifecycle order unchanged
  - keep wording operator-facing
  - do not imply runtime automation
- Execution Note:
  - `serial`
- Out Of Scope:
  - broad cross-link cleanup
  - rewriting `AGENTS.md`

## Verification Contract

- Execution Strategy: `serial`
- Strategy Notes:
  - update the routing matrix first
  - then update the pattern and richer example surfaces for parity
- Verification Target:
  - manual parity review across all three files
  - targeted `rg` checks for critique, execution strategy, and system interaction language
- Done Condition:
  - the three operator-facing surfaces agree on the current workflow truth

## Stop Conditions

- if the wording starts implying a new lifecycle stage
- if parity requires touching files beyond the approved three

## Execution State

- Status: `awaiting_review`
- Notes:
  - `system interaction check required because workflow truth is exposed through multiple operator-facing surfaces`
