---
title: stage ownership routing reference
type: requirements
status: active
date: 2026-04-07
---

# Stage Ownership Routing Requirements

## Problem

`cmon` already knows that different stages use different collaboration patterns, but the truth is scattered across long docs. That makes it harder for operators to route work correctly and easier to over-apply multi-agent parallelism.

## Requirements

- R1. Add one compact reference for stage ownership across the `cmon` lifecycle.
- R2. Surface the same truth in the project guide and the operator-facing workflow pattern.
- R3. Preserve the existing lifecycle and skill names.
- R4. Make it explicit that multi-role coverage does not imply symmetric parallel co-authoring at every stage.
- R5. Keep the reference short enough to scan quickly.
- R6. Use this task to prove a valid `parallel` execution shape with disjoint write scopes.

## Success Criteria

- An operator can answer which stages are multi-lens, owner-led, engineering-owned, or engineering execution without reading long-form design docs.
- The new reference does not create a new stage or new execution mode.
- The supporting end-to-end example proves `parallel` only through disjoint write surfaces.

## Non-Goals

- redesign the lifecycle
- rewrite every workflow doc in the repo
- introduce runtime orchestration
