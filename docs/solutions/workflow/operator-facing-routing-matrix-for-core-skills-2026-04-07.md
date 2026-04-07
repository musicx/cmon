---
title: operator-facing routing matrix for core skills
date: 2026-04-07
kind: pattern
area: workflow
severity: moderate
tags:
  - workflow
  - routing
  - operator-guidance
---

# Operator-Facing Routing Matrix For Core Skills

## Context

As `cmon` gained explicit stages, including an explicit design stage, templates, and execution docs, the workflow became stronger but also harder to enter quickly. The deep docs were correct, but an operator could still waste time deciding which core skill should run next.

## Guidance

When a harness repo has multiple explicit stages with different entry conditions and outputs, add one compact routing matrix that states for each core skill:

- when to use it
- what it requires
- what it produces
- what it should not be used for
- what the normal next step is

Keep this artifact short and operator-facing. It should summarize the boundary model, not replace the deeper skill docs.

## Why This Matters

Without a routing matrix, operators tend to do one of two bad things:

- they guess the next stage from memory and drift into the wrong skill
- they over-read long design docs just to answer a simple routing question

The matrix reduces entry ambiguity while preserving the repo's stronger boundary model.

It also creates a cleaner review standard for small docs work: if a routing reference is correct and bounded, it can be accepted with follow-up instead of bloating the unit to solve every discoverability concern immediately.

## When To Apply

- when a harness or workflow repo has enough explicit stages that operators can reasonably mis-sequence them
- when deep docs already exist, but there is no short routing surface

- do not use this as a replacement for the actual stage docs
- do not use this to invent new stages or promise automation the repo does not support

## Examples

- Before: workflow truth exists only across `AGENTS.md`, architecture docs, and per-skill docs, so the operator must reconstruct routing mentally
- After: one compact matrix summarizes stage entry conditions and legal next steps, while deep docs remain the source of detailed behavior

## Related

- `docs/architecture/2026-04-07-core-skill-routing-matrix-v0.md`
- `docs/architecture/2026-04-07-e2e-example-core-skill-routing-matrix.md`
- `docs/architecture/2026-04-07-core-skill-routing-matrix-final-review.md`
