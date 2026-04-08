---
title: narrow scope expansion when unit goal stays fixed
date: 2026-04-07
kind: pattern
area: workflow
severity: moderate
tags:
  - workflow
  - scope-expansion
  - execution
  - boundaries
---

# Narrow Scope Expansion When Unit Goal Stays Fixed

## Context

`cmon:work` is deliberately strict about scope, but strict does not mean brittle.

Sometimes execution reveals that one or two additional files must change for the already-approved unit to remain truthful and internally consistent.

The key distinction is not "did the file list grow?".
The key distinction is "did the unit goal change?".

## Guidance

Use a scope-expansion request only when all of the following are true:

- the original unit goal still stands unchanged
- the additional files are a narrow dependency of that same goal
- the work can continue responsibly without returning to `cmon:plan`

If any of those are false or unclear, stop and return to planning.

Good scope expansion looks like this:

- execution begins with a bounded unit
- a contradiction or missing dependency is discovered
- the additional files are named explicitly
- the boundary check is recorded
- work continues only after the expansion is accepted as narrow

## Review Handoff

If scope expansion happens, the record should not disappear before review.

The review packet should carry:

- the work execution report
- the scope expansion request itself
- a short explanation of why the unit goal stayed fixed

That keeps reviewers from seeing a widened diff without the boundary reasoning that justified it.

Bad scope expansion looks like this:

- "while I am here" cleanup
- adding adjacent improvements because they feel related
- changing the user-facing goal mid-execution
- using expansion to avoid admitting the plan was wrong

## Why This Matters

Without this pattern, teams usually fall into one of two bad behaviors:

- they silently expand the unit and lose reviewability
- they treat every new file as a full planning failure, even when the goal has not changed

The narrow-expansion path preserves bounded execution without making the workflow unusably rigid.

## Related

- `templates/work/scope-expansion-request-template.md`
- `templates/review/review-run-manifest-template.md`
- `templates/review/reviewer-context-template.md`
- `docs/architecture/2026-04-07-work-execution-v0.md`
- `docs/architecture/2026-04-07-e2e-example-proof-coverage-scope-expansion-v1.md`
