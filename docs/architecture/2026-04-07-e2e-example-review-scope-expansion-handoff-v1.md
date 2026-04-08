# cmon End-to-End Example: Review Scope Expansion Handoff v1

Date: 2026-04-07
Status: Draft

This document records a less documentation-heavy end-to-end example for `cmon`.

Its purpose is to prove two things at once:

- `cmon:review` should receive scope-expansion evidence when `cmon:work` widened a unit explicitly
- `cmon:compound` can update an existing workflow pattern doc on a task centered on templates and skill contracts rather than summary architecture docs

## Example Task

Teach the review packet to carry scope-expansion evidence, then refresh the existing narrow-scope-expansion pattern doc so it includes review handoff guidance.

## Artifact Chain

### Understand

- Context packet: `docs/architecture/2026-04-07-review-scope-expansion-handoff-understand-packet.md`

### Think

- Requirements artifact: `docs/brainstorms/2026-04-07-review-scope-expansion-handoff-requirements.md`

### Design

- Design run manifest: `docs/architecture/2026-04-07-review-scope-expansion-handoff-design-run-manifest.md`
- Approved design: `docs/designs/2026-04-07-review-scope-expansion-handoff-design.md`
- Engineering challenge: `docs/architecture/2026-04-07-review-scope-expansion-handoff-engineering-design-challenge.md`
- Operations challenge: `docs/architecture/2026-04-07-review-scope-expansion-handoff-ops-design-challenge.md`
- Design synthesis: `docs/architecture/2026-04-07-review-scope-expansion-handoff-design-synthesis.md`

### Plan

- Plan run manifest: `docs/architecture/2026-04-07-review-scope-expansion-handoff-plan-run-manifest.md`
- Research summary: `docs/architecture/2026-04-07-review-scope-expansion-handoff-research-summary.md`
- Implementation plan: `docs/plans/2026-04-07-review-scope-expansion-handoff-plan.md`
- Plan critique input: `docs/architecture/2026-04-07-review-scope-expansion-handoff-plan-critique-input.md`
- Design consistency review: `docs/architecture/2026-04-07-review-scope-expansion-handoff-design-consistency-review.md`
- Engineering feasibility review: `docs/architecture/2026-04-07-review-scope-expansion-handoff-engineering-feasibility-review.md`
- Scope and risk review: `docs/architecture/2026-04-07-review-scope-expansion-handoff-scope-risk-review.md`
- Critique summary: `docs/architecture/2026-04-07-review-scope-expansion-handoff-plan-critique-summary.md`

### Work

- Work manifest: `docs/architecture/2026-04-07-review-scope-expansion-handoff-work-run-manifest.md`
- Verification evidence: `docs/architecture/2026-04-07-review-scope-expansion-handoff-verification.md`
- System interaction check: `docs/architecture/2026-04-07-review-scope-expansion-handoff-system-interaction-check.md`
- Spec compliance review: `docs/architecture/2026-04-07-review-scope-expansion-handoff-spec-compliance-review.md`
- Code quality review: `docs/architecture/2026-04-07-review-scope-expansion-handoff-code-quality-review.md`
- Execution report: `docs/architecture/2026-04-07-review-scope-expansion-handoff-execution-report.md`

### Review

- Review run manifest: `docs/architecture/2026-04-07-review-scope-expansion-handoff-review-run-manifest.md`
- Review context: `docs/architecture/2026-04-07-review-scope-expansion-handoff-review-context.md`
- Product review: `docs/architecture/2026-04-07-review-scope-expansion-handoff-product-review.md`
- Engineering review: `docs/architecture/2026-04-07-review-scope-expansion-handoff-engineering-review.md`
- Operations review: `docs/architecture/2026-04-07-review-scope-expansion-handoff-ops-review.md`
- Review synthesizer input: `docs/architecture/2026-04-07-review-scope-expansion-handoff-review-synthesizer-input.md`
- Final review: `docs/architecture/2026-04-07-review-scope-expansion-handoff-final-review.md`

### Compound

- Compound run manifest: `docs/architecture/2026-04-07-review-scope-expansion-handoff-compound-run-manifest.md`
- Trigger checklist: `docs/architecture/2026-04-07-review-scope-expansion-handoff-trigger-checklist.md`
- Compound context: `docs/architecture/2026-04-07-review-scope-expansion-handoff-compound-context.md`
- Product curator: `docs/architecture/2026-04-07-review-scope-expansion-handoff-product-curator.md`
- Engineering curator: `docs/architecture/2026-04-07-review-scope-expansion-handoff-engineer-curator.md`
- Operations curator: `docs/architecture/2026-04-07-review-scope-expansion-handoff-ops-curator.md`
- Compound synthesizer input: `docs/architecture/2026-04-07-review-scope-expansion-handoff-compound-synthesizer-input.md`
- Compound decision: `docs/architecture/2026-04-07-review-scope-expansion-handoff-compound-decision.md`

## What This Example Proved

- `cmon:review` can accept scope-expansion evidence as part of its normal input contract.
- a less documentation-heavy task can still drive `update_existing` in `cmon:compound`.
- existing workflow knowledge can be refreshed from template and skill-contract changes rather than only from summary architecture edits.

## What It Still Does Not Prove

- It does not yet prove a fully blocked execution path.
- It does not yet prove a code-changing `parallel` execution example.
