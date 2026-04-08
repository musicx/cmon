---
title: routing matrix refresh for mature work gates
status: approved
date: 2026-04-07
---

# Routing Matrix Refresh For Mature Work Gates

## Problem Frame

`cmon` has gained stricter planning and execution behavior, but the shortest operator-facing routing surfaces still describe an older, lighter flow. That creates a gap between the real workflow and the quick-reference workflow.

## Intended Outcome

An operator can see, from the shortest routing surfaces, that:

- `cmon:plan` may stay in planning while critique is unresolved
- `cmon:work` now requires execution strategy selection
- `cmon:work` may require a system interaction check before review
- these additions do not change the canonical lifecycle, they refine stage-entry and handoff discipline

## Requirements

### Core Behavior

- R1. Refresh the operator-facing routing matrix so it reflects the mature `cmon:plan` and `cmon:work` contracts.
- R2. Surface `cmon:plan` critique readiness without inventing a new stage.
- R3. Surface `cmon:work` execution strategy and system interaction preflight without turning the matrix into a full work spec.
- R4. Preserve the canonical lifecycle order: `understand -> think -> design -> plan -> work -> review -> compound`.

### Constraints Or Guardrails

- R5. Keep the routing matrix compact and operator-facing.
- R6. Do not imply runtime automation, auto-dispatch, or a `gstack`-style delivery chain.
- R7. Keep the reusable workflow lesson aligned with the refreshed routing surface.

## Success Criteria

- A reader using the routing matrix can tell that `plan` may need critique before `work`.
- A reader can tell that `work` now has preflight responsibilities beyond “edit files and run tests.”
- The refreshed routing surface and the reusable workflow pattern remain consistent with each other.

## Scope Boundaries

- No new lifecycle stages
- No new runtime layer
- No full rewrite of `AGENTS.md` or the core skill docs
- No broad cross-link cleanup across the whole repo

## Key Decisions

- Refresh the existing routing matrix instead of creating a second operator-facing routing doc.
- Update the existing workflow pattern doc instead of creating a second near-duplicate lesson.
- Use one bounded documentation unit with serial execution because the parity between operator-facing surfaces matters.

## Risks Or Tensions

- If the matrix gets too detailed, it stops being a routing artifact.
- If the pattern doc is not updated, the repo will present two different “truths” for the same workflow.

## Open Questions

### Resolve Before Planning

- none

### Deferred To Planning

- Whether the example summary itself should be updated as part of the same bounded unit for parity

## Next Step

- `cmon:design`
