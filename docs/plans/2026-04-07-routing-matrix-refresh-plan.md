---
title: routing matrix refresh for mature work gates
type: docs
status: active
date: 2026-04-07
origin: docs/brainstorms/2026-04-07-routing-matrix-refresh-requirements.md
design: docs/designs/2026-04-07-routing-matrix-refresh-design.md
mode: create
deepened: none
---

# Routing Matrix Refresh Plan

## Overview

Refresh the shortest operator-facing workflow references so they reflect the mature `cmon:plan` and `cmon:work` contracts without changing lifecycle shape.

## Problem Frame

The quickest routing surfaces still describe an earlier version of the workflow. Operators can now understand the real stage contracts only by reading deeper docs, which defeats the point of the routing reference.

## Requirements Trace

- R1. Refresh the routing matrix for mature `plan` and `work` contracts.
- R2. Surface critique readiness without inventing a new stage.
- R3. Surface execution strategy and system interaction preflight.
- R4. Preserve lifecycle order.
- R5. Keep the artifact compact.
- R6. Do not imply runtime automation.
- R7. Keep the reusable lesson aligned.

## Design Trace

- D1. Treat critique and work preflight as stage-internal gates, not new lifecycle stages.
- D2. Update all operator-facing workflow surfaces touched by the pattern.
- D3. Keep the routing matrix scan-friendly.

## Scope Boundaries

- No lifecycle rewrite
- No new skill names
- No runtime claims
- No global cross-link cleanup

## Relevant Context

### Existing Patterns

- `docs/architecture/2026-04-07-core-skill-routing-matrix-v0.md`
- `docs/solutions/workflow/operator-facing-routing-matrix-for-core-skills-2026-04-07.md`
- `docs/architecture/2026-04-07-core-skills-v0.md`

### Existing Constraints

- The shortest routing surface must remain concise.
- Workflow maturity changes should not create new named stages.

### Prior Learnings

- `docs/solutions/workflow/operator-facing-routing-matrix-for-core-skills-2026-04-07.md`

### Research Notes

- The current routing matrix does not mention critique, execution strategy, or system interaction checks.
- Parity drift already exists between the operator-facing matrix and the now-mature work/plan contracts.

## Key Technical Decisions

- Use one bounded documentation unit with serial execution across multiple files.
- Update the existing pattern doc instead of creating a new duplicate solution.
- Update the richer example summary as part of the same unit to preserve proof-surface parity.

## Open Questions

### Resolved During Planning

- Should the richer example summary be in scope?
  - Resolution: yes, because the repo uses examples as operator-facing proof surfaces.

### Deferred To Execution

- none

## Implementation Units

- [ ] **Unit 1: Refresh operator-facing workflow surfaces**

**Goal:** Update the routing matrix, reusable workflow pattern, and richer example summary so they all reflect the current `plan` and `work` contracts.

**Requirements:** [R1, R2, R3, R4, R5, R6, R7]

**Dependencies:** None

**Files:**
- Modify: `docs/architecture/2026-04-07-core-skill-routing-matrix-v0.md`
- Modify: `docs/solutions/workflow/operator-facing-routing-matrix-for-core-skills-2026-04-07.md`
- Create: `docs/architecture/2026-04-07-e2e-example-routing-matrix-refresh-v1.md`

**Constraints:**
- Keep lifecycle order unchanged.
- Keep wording operator-facing.
- Do not imply automation or runtime behavior.
- Keep critique and preflight inside existing stages.

**Approach:**
- Refresh the matrix rows for `cmon:plan` and `cmon:work`.
- Refresh entry checks for `cmon:work` and `cmon:review`.
- Update the reusable workflow pattern to describe mature routing surfaces.
- Record a richer example summary that shows why the refresh exists.

**Patterns To Follow:**
- `docs/architecture/2026-04-07-core-skill-routing-matrix-v0.md`
- `docs/solutions/workflow/operator-facing-routing-matrix-for-core-skills-2026-04-07.md`
- `docs/architecture/2026-04-07-e2e-example-core-skill-routing-matrix.md`

**Execution Note:**
- `serial`

**Test Scenarios:**
- Happy path: routing matrix explicitly shows critique-cleared `plan` behavior and `work` preflight.
- Edge case: refreshed wording stays concise and does not invent a new stage.
- Failure path: no operator-facing surface should imply runtime automation.
- Integration: routing matrix, reusable pattern doc, and richer example summary stay aligned on the same workflow truth.

**Verification:**
- Manual parity review across the three workflow surfaces
- `rg` check that the refreshed routing surface now mentions critique, execution strategy, and system interaction
- line-by-line comparison against `skills/plan/SKILL.md` and `skills/work/SKILL.md`

**Done When:**
- The routing matrix reflects the mature `plan` and `work` contracts.
- The reusable workflow pattern matches that refreshed routing surface.
- The richer example summary records the new proof case.

## Review Watchpoints

- Product: does the routing surface remain fast to scan?
- Engineering: do the refreshed docs stay consistent with the actual skill contracts?
- Operations: does the wording avoid implying runtime or automation guarantees?

## Risks

- The matrix could become too dense if every new gate is described inline.
- Updating only one surface would preserve parity drift rather than fix it.

## Plan Critique Result

- Design consistency review: revise
- Engineering feasibility review: revise
- Scope and risk review: pass
- Readiness decision: ready_for_work

## Plan Quality Check

- Requirements covered: yes
- Design decisions preserved: yes
- Exact file paths named: yes
- Feature-bearing units have test scenarios: yes
- Execution boundaries are reviewable: yes
- Research shaped the plan where needed: yes
- Deferred questions are truly execution-owned: yes
- Critique stack cleared when needed: yes

## Recommended Next Step

- `cmon:work`
