---
title: stage ownership routing reference
type: docs
status: active
date: 2026-04-07
origin: docs/brainstorms/2026-04-07-stage-ownership-parallel-requirements.md
design: docs/designs/2026-04-07-stage-ownership-parallel-design.md
mode: create
deepened: none
---

# Stage Ownership Parallel Plan

## Overview

Add a compact stage-ownership routing reference and surface it across the minimum repo surfaces operators actually use.

## Requirements Trace

- R1. Add one compact reference for stage ownership.
- R2. Surface the same truth in the project guide and operator-facing workflow pattern.
- R3. Preserve lifecycle and skill names.
- R4. Prevent over-application of parallel co-authoring.
- R5. Keep the reference compact.
- R6. Prove a valid `parallel` work shape.

## Design Trace

- D1. One canonical reference only.
- D2. `AGENTS.md` gets a short heuristic plus link.
- D3. The operator-facing pattern gets ownership implications only.
- D4. Split the work by disjoint write surfaces.

## Implementation Units

- [ ] **Unit 1: Add the ownership reference and surface it through disjoint repo surfaces**

**Files:**
- Create: `docs/architecture/2026-04-07-stage-ownership-routing-v0.md`
- Modify: `docs/architecture/2026-04-07-core-skills-v0.md`
- Modify: `docs/architecture/2026-04-07-design-plan-work-v1-gap-list.md`
- Modify: `AGENTS.md`
- Modify: `docs/solutions/workflow/operator-facing-routing-matrix-for-core-skills-2026-04-07.md`

**Constraints:**
- keep the canonical ownership truth in one file
- keep derivative surfaces brief
- prove `parallel` only through disjoint write scopes

**Parallel Sub-Steps:**
- A. architecture surface updates
- B. policy and operator surface updates

**Execution Note:**
- `parallel`

**Verification:**
- confirm the two sub-steps write to disjoint file sets
- confirm all touched surfaces align on the same ownership split
- confirm no surface implies parallel co-authoring as a default

## Review Watchpoints

- Product: is the new ownership guidance faster to scan than the existing long-form explanation?
- Engineering: is the `parallel` split truly disjoint?
- Operations: does any surface imply unsupported concurrency or automation?

## Recommended Next Step

- `cmon:work`
