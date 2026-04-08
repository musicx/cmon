# cmon Refresh-Knowledge Execution v0

Date: 2026-04-07
Status: Draft

This document turns `cmon:refresh-knowledge` into a repeatable maintenance workflow.

## 1. Purpose

`cmon:refresh-knowledge` exists to keep durable knowledge trustworthy when newer evidence suggests drift.

It should answer:

1. is the suspected drift real
2. what kind of maintenance action fits
3. how narrow can the maintenance pass stay

## 2. Execution Stages

### Stage 1: Lock Refresh Scope

Start from:

- `templates/compound/knowledge-refresh-manifest-template.md`

The scope must be narrow:

- one topic
- one module
- one pattern family
- or one small set of clearly overlapping docs

If the scope is broad and fuzzy:

- stop
- narrow it first

### Stage 2: Gather Current And Newer Evidence

Assemble:

- candidate docs
- newer source artifacts
- related current repo evidence
- known reason drift is suspected

The point is not to re-document everything.
The point is to compare the old guidance against the newer source of truth.

### Stage 3: Classify The Maintenance Problem

Use:

- `docs/architecture/2026-04-07-refresh-knowledge-rubric-v0.md`

Classify the main issue as one or more of:

- `stale`
- `overlap`
- `duplicate`
- `too_broad`
- `contradicted`
- `none`

### Stage 4: Choose The Narrowest Valid Action

Allowed actions:

- `update_existing`
- `consolidate`
- `narrow`
- `deprecate`
- `keep_as_is`

Prefer the smallest action that restores trust.

### Stage 5: Write Refresh Summary

Use:

- `templates/compound/knowledge-refresh-summary-template.md`

The summary should capture:

- scope reviewed
- docs inspected
- evidence considered
- maintenance action
- follow-up if the pass should continue

### Stage 6: Emit Transition Decision

Use:

- `templates/workflow/stage-transition-decision-template.md`

Typical outcomes:

- `proceed -> complete`
- `revise -> cmon:refresh-knowledge`
- `block`

## 3. Maintenance Rules

### `update_existing`

Choose this when:

- the same lesson remains valid
- the newer evidence mostly sharpens or refreshes it

### `consolidate`

Choose this when:

- two or more docs materially overlap
- leaving them separate would likely create future drift

### `narrow`

Choose this when:

- the doc overclaims
- but a smaller, stricter version is still useful

### `deprecate`

Choose this when:

- the doc is no longer trustworthy
- and the newer replacement or better scope is known

### `keep_as_is`

Choose this when:

- the suspicion of drift is weak
- or the overlap is only superficial

## 4. Policy Choice

`cmon:refresh-knowledge` should stay:

- targeted
- evidence-based
- biased toward minimal maintenance

It should not become:

- a sweeping rewrite tool
- a default post-step after every compound pass
- a second compounding workflow in disguise

## 5. Related

- `skills/refresh-knowledge/SKILL.md`
- `docs/architecture/2026-04-07-knowledge-maintenance-v0.md`
- `docs/architecture/2026-04-07-refresh-knowledge-rubric-v0.md`
