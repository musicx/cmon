# cmon Compound Execution v0

Date: 2026-04-07
Status: Draft

This document turns `cmon:compound` into a multi-role knowledge-capture flow.

## 1. Purpose

`cmon:compound` exists to preserve reusable learning after accepted work.

It should answer:

1. does this work create a reusable lesson?
2. if yes, what kind of lesson is it?
3. should we create a new doc or update an existing one?

## 2. Execution Stages

### Stage 1: Run Trigger Check

Use:

- `templates/compound/trigger-checklist-template.md`

to classify the work as:

- `mandatory`
- `recommended`
- `skip`

If the result is `skip`, stop unless the user explicitly wants a documentation pass anyway.

### Stage 2: Build Shared Compound Context

Assemble:

- completed work summary
- source artifacts
- trigger signals
- related existing knowledge

Use:

- `templates/compound/compound-context-template.md`

### Stage 3: Dispatch Lens Curators

Dispatch in parallel:

- `agents/compound/product-curator.md`
- `agents/compound/engineer-curator.md`
- `agents/compound/ops-curator.md`

Wrap each call with:

- `templates/compound/lens-invocation-template.md`

### Stage 4: Synthesize

Pass the shared context and curator outputs into:

- `agents/compound/compound-synthesizer.md`

Use:

- `templates/compound/synthesizer-input-template.md`

### Stage 5: Write Or Update Durable Knowledge

Depending on the synthesized result:

- new bug learning:
  - `templates/solutions/bug-solution-template.md`
- new pattern or guardrail:
  - `templates/solutions/pattern-solution-template.md`
- update existing:
  - revise the existing doc instead of creating a duplicate

Default target:

- `docs/solutions/`

Use `docs/architecture/` only for stable repo-level guidance that no longer fits as a solution doc.

If the synthesized result exposes a broader maintenance problem:

- overlapping docs
- stale pattern surfaces
- contradiction between old and new guidance

recommend a narrow `cmon:refresh-knowledge` follow-up instead of widening the current pass.

## 3. v0 Policy Choice

`cmon:compound` is mandatory when triggered, but it is not universal after every accepted change.

This is deliberate.

The point is not to create more docs.

The point is to preserve high-reuse learning.

## 4. Why This Matches cmon

This design brings your required role separation into knowledge capture:

- product preserves framing lessons
- engineering preserves root causes and patterns
- operations preserves rollout and runtime guardrails

That makes `compound` part of the harness, not an afterthought.

## 5. Next Step

This execution doc now has a matching manual operating procedure:

- `docs/architecture/2026-04-07-compound-operating-procedure-v0.md`

The next useful upgrade after this is:

- targeted maintenance support for stale or overlapping durable knowledge
