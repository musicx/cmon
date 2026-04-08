---
title: stage ownership routing reference design
type: design
status: approved
date: 2026-04-07
origin: docs/brainstorms/2026-04-07-stage-ownership-parallel-requirements.md
---

# Stage Ownership Routing Design

## Design Outcome

Create one canonical compact reference under `docs/architecture/` and surface only short heuristic language in the other two high-traffic repo surfaces.

## Key Decisions

- D1. The canonical ownership truth lives in one dedicated architecture doc.
- D2. `AGENTS.md` gets only a short heuristic plus a link to the canonical doc.
- D3. The operator-facing workflow pattern gets only the ownership implications needed for routing.
- D4. The work may be executed in `parallel` because the architecture surface updates and the policy/operator surface updates have disjoint write scopes.

## Surface Map

### Architecture Surface

- Create `docs/architecture/2026-04-07-stage-ownership-routing-v0.md`
- Update `docs/architecture/2026-04-07-core-skills-v0.md`
- Update `docs/architecture/2026-04-07-design-plan-work-v1-gap-list.md`

### Policy And Operator Surface

- Update `AGENTS.md`
- Update `docs/solutions/workflow/operator-facing-routing-matrix-for-core-skills-2026-04-07.md`

## Design Guardrails

- Do not add a new routing matrix column everywhere.
- Do not replicate the full ownership table across multiple files.
- Keep the canonical doc short enough to function as a quick reference.
- Keep the other surfaces derivative and link-oriented.
