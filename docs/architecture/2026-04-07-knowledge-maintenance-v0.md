# cmon Knowledge Maintenance v0

Date: 2026-04-07
Status: Draft

This document defines the first maintenance layer for `cmon` durable knowledge.

`cmon:compound` already captures new or updated learning.

This layer exists for the next problem:

- how to keep existing durable knowledge trustworthy once enough solution docs accumulate

## 1. Design Choice

`cmon` should separate:

- knowledge capture
- knowledge maintenance

Why:

- capture is triggered by fresh work
- maintenance is triggered by drift, overlap, or contradiction

Trying to force both into one step makes both noisier.

## 2. Auxiliary Skills

The maintenance surfaces are:

- `cmon:refresh-knowledge`
- `cmon:revalidate`

These are intentionally not core lifecycle stages.

`cmon:refresh-knowledge` is a narrow maintenance helper for:

- stale docs
- overlapping docs
- duplicate guidance
- pattern docs that no longer match current evidence

`cmon:revalidate` is a periodic or ad hoc audit helper for:

- artifact trust checking
- lifecycle-state assessment
- deciding whether follow-up should be refresh, supersede, archive, or no action

## 3. Supported Maintenance Actions

### Update Existing

Use when:

- the same lesson is still valid
- but examples, references, or framing need refresh

### Consolidate

Use when:

- two or more docs now describe substantially the same lesson
- one clearer doc would reduce drift

### Narrow

Use when:

- a doc over-generalizes beyond what the repo currently supports

### Deprecate

Use when:

- a doc is no longer trustworthy
- and a better replacement is known

### Keep As-Is

Use when:

- the evidence for drift is weak
- or the suspected overlap is superficial

## 4. Required Templates

Use:

- `templates/compound/knowledge-refresh-manifest-template.md`
- `templates/compound/knowledge-refresh-summary-template.md`
- `templates/workflow/stage-transition-decision-template.md`

## 5. Relationship To `cmon:compound`

Use `cmon:compound` when:

- the main task is capturing new reusable knowledge from accepted work

Use `cmon:refresh-knowledge` when:

- the main task is maintaining existing durable knowledge against newer evidence

Use `cmon:revalidate` when:

- the main task is deciding which existing artifacts can still be trusted
- the right maintenance action is not yet clear
- the audit scope includes proof docs, routing docs, or multiple artifact candidates

If a fresh `cmon:compound` pass discovers stale candidates, it should usually recommend:

- a direct narrow update when one obvious doc should be refreshed
- `cmon:revalidate` when the trust problem is broader or still unclear
- `cmon:refresh-knowledge` only when one narrow maintenance target is already clear

## 6. Policy Choice

Knowledge maintenance should be:

- targeted
- evidence-based
- narrow by default

It should not become:

- a background cleanup treadmill
- a broad docs rewrite
- a second runtime system

## 7. Next Step

After this layer exists, the next optional step is:

- a light helper for scoped doc discovery and overlap scoring, but only if repeated manual refresh work shows real payoff

## 8. Related

- `docs/architecture/2026-04-07-compound-execution-v0.md`
- `docs/architecture/2026-04-07-next-opportunities-and-decisions-v0.md`
- `docs/architecture/2026-04-08-revalidate-execution-v0.md`
