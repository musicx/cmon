---
name: cmon:refresh-knowledge
description: Use to review and refresh existing durable knowledge when solution docs, pattern docs, or architecture guidance may now be stale, overlapping, duplicated, or contradicted by newer work.
---

# cmon:refresh-knowledge

Refresh the knowledge store without widening into a broad documentation cleanup project.

This is an auxiliary workflow skill.

Its purpose is to maintain the quality of durable knowledge after `cmon:compound` has already created enough material that drift becomes a real cost.

## When to Use

Use this skill when one or more of these are true:

- a new `cmon:compound` result contradicts an older solution doc
- multiple docs now appear to describe the same lesson
- a pattern doc looks broader than current evidence supports
- a refactor, migration, rename, or workflow change likely made older docs stale
- an operator wants to audit one narrow knowledge area for drift

## Non-Goals

Do not use this skill to:

- rewrite the whole knowledge store in one pass
- create a new learning from scratch when `cmon:compound` should do that
- perform broad repo cleanup unrelated to durable knowledge
- turn docs maintenance into a mandatory post-step after every change

## Inputs

Use:

- `templates/compound/knowledge-refresh-manifest-template.md`

Minimum inputs:

1. refresh scope
2. candidate docs
3. newer evidence or source artifacts
4. expected maintenance action when already known

## Allowed Outcomes

This skill may recommend or perform only narrow maintenance actions:

- update existing doc
- consolidate overlapping docs
- narrow a pattern doc that is too broad
- deprecate a stale doc with a clear replacement
- keep as-is when the evidence is weak

It should prefer the smallest change that restores trust in the knowledge store.

## Output

Use:

- `templates/compound/knowledge-refresh-summary-template.md`

The result should state:

- scope reviewed
- docs inspected
- evidence considered
- maintenance decision
- follow-up if further refresh is needed

## Hard Rules

- Do not broaden the refresh scope silently
- Do not delete or deprecate a doc without naming the evidence and replacement
- Do not create duplicate docs when an update would be cleaner
- Do not rewrite a doc just because wording could be cleaner if its guidance is still accurate
- Do not recommend broad sweeps when a narrow targeted refresh is enough

## Handoff

Typical transition targets:

- `proceed -> complete` after a narrow refresh is complete
- `revise -> cmon:refresh-knowledge` when the maintenance pass is correct but incomplete
- `block` when the newer evidence is still too weak or contradictory

Operational references:

- `docs/architecture/2026-04-07-refresh-knowledge-execution-v0.md`
- `docs/architecture/2026-04-07-refresh-knowledge-operating-procedure-v0.md`
- `docs/architecture/2026-04-07-refresh-knowledge-rubric-v0.md`
- `docs/architecture/2026-04-07-auxiliary-skill-invocation-policy-v0.md`
