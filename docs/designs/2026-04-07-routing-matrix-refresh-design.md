---
title: routing matrix refresh design
type: workflow
status: approved
date: 2026-04-07
origin: docs/brainstorms/2026-04-07-routing-matrix-refresh-requirements.md
owner_mode: product-led
---

# Routing Matrix Refresh Design

## Design Scope

Refresh the shortest operator-facing workflow references so they expose mature `plan` and `work` gates without becoming long-form process docs.

## Problem Summary

The operator-facing routing matrix currently shows stage order and basic entry conditions, but not the newer discipline inside `cmon:plan` and `cmon:work`. The result is a mismatch between the repo's real execution model and the quickest entry surface an operator is likely to read.

## Requirements Trace

- R1. Refresh the routing matrix for mature `plan` and `work` contracts.
- R2. Surface `plan` critique readiness without inventing a new stage.
- R3. Surface `work` execution strategy and system interaction preflight.
- R4. Preserve lifecycle order.
- R5. Keep the artifact compact.
- R6. Do not imply runtime automation.
- R7. Keep the reusable workflow lesson aligned.

## Intended Operator Experience

An operator should still be able to scan the matrix in under a minute, but now leave with the correct mental model:

- `plan` may remain in `cmon:plan` until critique is clear
- `work` requires explicit preflight, not just file edits and tests
- these are stage-internal gates, not new stages

## Information Design

### Matrix Changes

- Update the `cmon:plan` row so `Produces` and `Normal Next Step` reflect critique-cleared readiness.
- Update the `cmon:work` row so `Requires` and `Produces` reflect:
  - execution strategy
  - system interaction check when relevant
  - internal review loop outputs

### Entry Check Changes

- Expand `Before cmon:work` to include:
  - execution strategy is chosen
  - system interaction triggers have been considered
- Expand `Before cmon:review` to include:
  - internal review loop has already passed

### Multi-Surface Parity

- Update the existing workflow pattern doc so its guidance reflects the richer routing surface.
- Update the new example summary so the proof case remains aligned with the refreshed routing references.

## Boundary Decisions

- Do not add a new critique stage to the lifecycle.
- Do not add a separate “preflight” doc as the primary routing surface.
- Do not broaden scope into global discoverability or cross-link cleanup.

## Challenge Decision

- Planning readiness: approved
- Must fix before planning:
  - ensure the change updates all operator-facing workflow surfaces touched by the pattern, not just the routing matrix
