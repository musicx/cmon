---
title: parallel execution for disjoint write surfaces
date: 2026-04-07
kind: pattern
area: workflow
severity: moderate
tags:
  - workflow
  - execution-strategy
  - parallel
  - reviewability
---

# Parallel Execution For Disjoint Write Surfaces

## Context

`cmon:work` allows `parallel`, but only under stricter conditions than repos that treat delegation as a general speed lever.

The key question is not "can multiple agents help?".
The key question is "can the work still be reviewed as one bounded unit after they do?".

## Guidance

Choose `parallel` only when all three conditions are true:

- each delegated sub-step has a disjoint write scope
- no sub-step depends on another sub-step's in-flight output
- the merged result can still be reviewed coherently against one approved unit

If any one of those conditions is false or unclear, use `serial` or `inline`.

For docs and workflow repos, a good `parallel` shape is often:

- one sub-step updates architecture or meta surfaces
- another sub-step updates policy or operator-facing surfaces

That split works only if the file sets do not overlap and the unit still has one acceptance question after merge.

## Why This Matters

Without this rule, `parallel` becomes a disguised form of scope drift.

The repository appears to move faster, but the real cost shows up in:

- merged diffs that no longer answer one question cleanly
- reviewers having to reconstruct which sub-step owned which decision
- hidden dependencies between partially completed work streams

The discipline is not "never parallelize".
The discipline is "parallelize only when the boundary survives merge".

## When To Apply

- when one approved unit can be decomposed into independent sub-steps with clean file boundaries
- when the operator can name the sub-step write scopes before editing starts

- do not use this to justify parallelism just because a task is large
- do not use this when a later sub-step needs the wording or structure created by an earlier one

## Related

- `docs/architecture/2026-04-07-work-execution-v0.md`
- `docs/architecture/2026-04-07-e2e-example-stage-ownership-parallel-v1.md`
- `docs/architecture/2026-04-07-stage-ownership-routing-v0.md`
