# cmon Revalidate Execution v0

Date: 2026-04-08
Status: Draft

This document turns `cmon:revalidate` into a repeatable artifact-audit workflow.

## 1. Purpose

`cmon:revalidate` exists to audit artifact trust and lifecycle state before maintenance work is forced into the wrong stage.

It should answer:

1. what is still trustworthy
2. what looks stale, overlapping, duplicated, too broad, or superseded
3. what the narrowest justified next action is

## 2. Execution Stages

### Stage 1: Lock Audit Scope

Start from:

- `templates/workflow/revalidate-run-manifest-template.md`

The audit scope should be explicit:

- one artifact family
- one topic area
- one workflow surface
- or one small set of suspect paths

If the audit scope is broad and vague:

- stop
- narrow it first

### Stage 2: Gather Current Contracts And Newer Evidence

Assemble:

- candidate artifacts
- current canonical contracts
- newer evidence or replacement artifacts
- known reason trust is in doubt

The point is not to rewrite.
The point is to compare current discoverable artifacts against the newer source of truth.

### Stage 3: Classify Findings

Classify each artifact or artifact group as one or more of:

- `trustworthy`
- `stale`
- `overlap`
- `duplicate`
- `too_broad`
- `superseded`
- `unclear`

### Stage 4: Choose The Narrowest Action

Allowed actions:

- `keep`
- `refresh`
- `supersede`
- `archive`
- `ignore_for_now`

Routing guidance:

- use `refresh` when a narrow maintenance pass is clearly needed
- use `supersede` when a newer canonical source already exists
- use `archive` when the artifact is still worth keeping as history but not as active guidance
- use `ignore_for_now` when evidence is weak

### Stage 5: Route Follow-Up

When a follow-up is needed, route to:

- direct narrow artifact update when the change is obvious and local
- `cmon:refresh-knowledge` when the issue is a narrow knowledge-maintenance problem
- `complete` when no change is justified yet

### Stage 6: Emit Summary And Transition Decision

Use:

- `templates/workflow/revalidate-summary-template.md`
- `templates/workflow/stage-transition-decision-template.md`

Typical outcomes:

- `proceed -> complete`
- `proceed -> cmon:refresh-knowledge`
- `revise -> cmon:revalidate`
- `block`

## 3. Policy Choice

`cmon:revalidate` should stay:

- periodic or explicitly requested
- artifact-family aware
- routing-oriented
- narrow by default

It should not become:

- an always-on GC daemon
- a mandatory post-compound ritual
- a broad cleanup campaign

## 4. Related

- `skills/revalidate/SKILL.md`
- `docs/architecture/2026-04-07-knowledge-maintenance-v0.md`
- `docs/architecture/2026-04-07-handoff-and-artifact-gc-analysis-v0.md`
