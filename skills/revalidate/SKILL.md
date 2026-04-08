---
name: cmon:revalidate
description: Use on a periodic basis, or when artifact trust is in doubt, to audit existing cmon artifacts, classify drift or lifecycle issues, and route the smallest justified follow-up without turning GC into a mandatory event-bound step.
---

# cmon:revalidate

Revalidate existing artifacts before they silently decay into untrustworthy guidance.

This is an auxiliary workflow skill.

It is intentionally discovery-first and routing-first.

Its primary job is not to rewrite artifacts directly.
Its primary job is to decide:

- what still looks trustworthy
- what now needs refresh
- what has been superseded
- what should be archived
- what can be ignored for now

## Purpose

`cmon` already has:

- `cmon:compound` for fresh reusable learning
- `cmon:refresh-knowledge` for narrow maintenance of known durable knowledge issues

`cmon:revalidate` exists for the step before narrow maintenance:

- periodic or ad hoc artifact trust checking
- artifact-family triage
- routing to the right next action

## When to Use

Use this skill when one or more of these are true:

- a periodic workflow audit is due
- a design, plan, routing doc, or solution doc may no longer match the current contracts
- multiple artifacts in one topic area may now overlap or contradict each other
- proof examples may no longer cleanly prove the behavior they were written for
- the operator suspects artifact drift but the right maintenance action is not yet obvious

## Non-Goals

Do not use this skill to:

- capture fresh reusable learning from one accepted task when `cmon:compound` is sufficient
- perform a broad repo rewrite
- force garbage collection after every `cmon:compound` pass
- become a background daemon or automatic crawler

## Inputs

Use:

- `templates/workflow/revalidate-run-manifest-template.md`

Minimum inputs:

1. audit scope
2. artifact families or candidate paths
3. current contracts or newer evidence
4. suspected issue type when already known

## Core Questions

This skill should answer:

1. which artifacts in scope are still trustworthy
2. which artifacts are stale, overlapping, duplicated, too broad, or superseded
3. which action is smallest and justified
4. whether follow-up belongs in:
   - `cmon:refresh-knowledge`
   - a narrow direct artifact update
   - archive / supersede
   - or no action

## Allowed Outcomes

This skill may recommend or perform only narrow lifecycle decisions:

- `keep`
- `refresh`
- `supersede`
- `archive`
- `ignore_for_now`

The result should prefer triage and routing over immediate rewrite unless the correction is obviously narrow and local.

## Output

Use:

- `templates/workflow/revalidate-summary-template.md`
- `templates/workflow/stage-transition-decision-template.md`

The result should state:

- scope reviewed
- artifact families and paths inspected
- evidence considered
- lifecycle findings
- recommended next action per artifact or group

## Relationship To Other Skills

### `cmon:compound`

Use `cmon:compound` when the main question is:

- what new reusable learning did accepted work create

Do not widen routine compounding into broad maintenance.

### `cmon:refresh-knowledge`

Escalate to `cmon:refresh-knowledge` when revalidation finds:

- one narrow knowledge area that clearly needs maintenance
- stale, overlapping, duplicated, or too-broad durable guidance

### Direct Update

Allow a direct narrow update when:

- the issue is obvious
- the scope is small
- and a full refresh pass would be unnecessary ceremony

## Hard Rules

- Do not silently broaden the audit scope
- Do not treat every stale suspicion as proof of drift
- Do not force `cmon:compound` to carry GC by default
- Do not turn this skill into a sweeping cleanup ritual
- Do not recommend `refresh-knowledge` when a direct narrow update is cleaner
- Do not recommend archiving or superseding without naming the newer source of truth

## Handoff

Typical transition targets:

- `proceed -> complete` after audit and routing are complete
- `proceed -> cmon:refresh-knowledge` when narrow maintenance is clearly required
- `revise -> cmon:revalidate` when the audit scope or evidence is still weak
- `block` when the newer source of truth is still too ambiguous to support lifecycle action

Operational references:

- `docs/architecture/2026-04-08-revalidate-execution-v0.md`
- `docs/architecture/2026-04-08-revalidate-operating-procedure-v0.md`
- `docs/architecture/2026-04-07-auxiliary-skill-invocation-policy-v0.md`
