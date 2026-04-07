---
title: core skill routing matrix
type: docs
status: active
date: 2026-04-07
origin: docs/brainstorms/2026-04-07-core-skill-routing-matrix-requirements.md
---

# Core Skill Routing Matrix Plan

## Overview

Add one compact operator-facing routing reference for the six core `cmon:*` skills and keep the implementation tightly bounded to a single new architecture doc.

## Problem Frame

The repo already defines the lifecycle and artifacts, but operators lack one short routing surface that answers which skill should run next and under what entry conditions.

## Requirements Trace

- R1. Add one compact routing reference for the six core `cmon:*` skills.
- R2. Show `Use When`, `Requires`, `Produces`, `Do Not Use It For`, and `Normal Next Step`.
- R3. Preserve canonical lifecycle order.
- R4. Keep it concise and operator-facing.
- R5. Do not invent new lifecycle stages, runtime layers, or names.
- R6. Do not expand scope into a cross-linking cleanup pass.

## Scope Boundaries

- Only one new doc is created as the implementation target.
- Existing core docs may be consulted but are not rewritten in this unit.
- Discoverability follow-up is explicitly out of scope.

## Relevant Context

### Existing Patterns

- `docs/architecture/2026-04-07-core-skills-v0.md`
- `docs/architecture/2026-04-07-artifact-templates-v0.md`
- `AGENTS.md`

### Existing Constraints

- Keep `cmon:*` names canonical.
- Keep the lifecycle order unchanged.
- Prefer compact operational docs when design intent already exists elsewhere.

### Prior Learnings

- none

## Key Technical Decisions

- Add the deliverable under `docs/architecture/` because it is a stable repo-level reference.
- Use a matrix plus entry checks instead of a prose walkthrough to optimize operator scan speed.

## Open Questions

### Resolved During Planning

- Should this live in `docs/architecture/` or `AGENTS.md`?
  - Resolution: `docs/architecture/`, because it is a stable operational reference rather than a project policy file.

### Deferred To Execution

- none

## Implementation Units

- [ ] **Unit 1: Author routing matrix doc**

**Goal:** Create one compact routing reference for the six core skills.

**Requirements:** [R1, R2, R3, R4, R5, R6]

**Dependencies:** None

**Files:**
- Create: `docs/architecture/2026-04-07-core-skill-routing-matrix-v0.md`

**Constraints:**
- Do not modify lifecycle order.
- Do not invent new skill names or alternate flows.
- Do not expand into broad doc cross-linking.

**Approach:**
- Summarize the canonical lifecycle first.
- Add a matrix row for each core skill.
- Add short entry checks to reduce routing mistakes at boundaries.

**Patterns To Follow:**
- `docs/architecture/2026-04-07-core-skills-v0.md`
- `docs/architecture/2026-04-07-artifact-templates-v0.md`

**Verification:**
- Manual line-by-line check against current skill docs and `AGENTS.md`
- Confirm that all six canonical names appear exactly once in the matrix
- Confirm the doc does not introduce any new stage or runtime concept

**Done When:**
- The routing matrix exists and matches the current six-skill lifecycle.
- Entry checks clearly indicate when to bounce back to earlier stages.

## Review Watchpoints

- Product: does the doc actually help an operator choose the right stage?
- Engineering: does it stay aligned with the existing lifecycle and skill docs?
- Operations: does it preserve the repo's “lightweight, no heavy runtime” boundary?

## Risks

- The document may duplicate too much detail from the existing skill docs.
- The document may be useful but still under-discoverable because cross-linking is out of scope.

## Recommended Next Step

- `cmon:work`
