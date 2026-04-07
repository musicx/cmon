# cmon End-to-End Example: Core Skill Routing Matrix

Date: 2026-04-07
Status: Draft

This document records the first end-to-end example run for `cmon`.

The example task was intentionally small:

- add one compact operator-facing routing matrix for the six core `cmon:*` skills

The goal was not to stress complexity. The goal was to prove the artifact chain and handoff contracts.

## Why This Example Was Chosen

This task is small enough to stay bounded, but real enough to exercise the full flow:

- `cmon:understand` must recover the current lifecycle and key docs
- `cmon:brainstorm` must choose the right artifact shape and hold scope
- `cmon:plan` must define one bounded implementation unit
- `cmon:work` must execute that unit with explicit verification
- `cmon:review` must judge the result against the approved intent

## Artifact Chain

### Understand

- Context packet: `docs/architecture/2026-04-07-core-skill-routing-matrix-understand-packet.md`

### Brainstorm

- Requirements artifact: `docs/brainstorms/2026-04-07-core-skill-routing-matrix-requirements.md`

### Plan

- Implementation plan: `docs/plans/2026-04-07-core-skill-routing-matrix-plan.md`

### Work

- Work manifest: `docs/architecture/2026-04-07-core-skill-routing-matrix-work-run-manifest.md`
- Implemented target: `docs/architecture/2026-04-07-core-skill-routing-matrix-v0.md`
- Verification evidence: `docs/architecture/2026-04-07-core-skill-routing-matrix-verification.md`
- Execution report: `docs/architecture/2026-04-07-core-skill-routing-matrix-execution-report.md`

### Review

- Review run manifest: `docs/architecture/2026-04-07-core-skill-routing-matrix-review-run-manifest.md`
- Review context bundle: `docs/architecture/2026-04-07-core-skill-routing-matrix-review-context.md`
- Product review: `docs/architecture/2026-04-07-core-skill-routing-matrix-product-review.md`
- Engineering review: `docs/architecture/2026-04-07-core-skill-routing-matrix-engineering-review.md`
- Operations review: `docs/architecture/2026-04-07-core-skill-routing-matrix-ops-review.md`
- Synthesizer input: `docs/architecture/2026-04-07-core-skill-routing-matrix-review-synthesizer-input.md`
- Final review: `docs/architecture/2026-04-07-core-skill-routing-matrix-final-review.md`

## What This Example Proved

- `understand -> brainstorm -> plan -> work -> review` now has a documentable, repeatable artifact chain.
- `work` and `review` can stay bounded without pretending every follow-up must be fixed in the same unit.
- The repo can express non-blocking review outcomes as `accepted_with_followup` instead of collapsing everything into pass/fail.

## What It Did Not Prove

- this example still stops at `review` and does not exercise `cmon:compound` directly.
- No lightweight script helper has been used yet; this is still a manual-first proof.
- The example is documentation-heavy and does not stress code-changing workflows.

## Immediate Follow-Ups Suggested By This Example

- add a second end-to-end example that changes more than one file and exercises scope expansion or a blocked state
- add an end-to-end example that continues from accepted review into `cmon:compound`
- add a manual operating procedure or lightweight script for the `cmon:review` helper
