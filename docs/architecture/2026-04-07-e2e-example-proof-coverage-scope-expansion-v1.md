# cmon End-to-End Example: Proof Coverage Scope Expansion v1

Date: 2026-04-07
Status: Draft

This document records a bounded end-to-end example for `cmon`.

Its purpose is to prove a different kind of boundary discipline than the earlier examples:

- work can begin from a real bounded unit
- execution can discover that the original file scope is too narrow
- the boundary can still be preserved by an explicit narrow scope expansion rather than silent drift

## Example Task

Add a compact workflow proof-coverage reference and surface it from the right overview docs without rewriting the repo's whole backlog.

## Artifact Chain

### Understand

- Context packet: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-understand-packet.md`

### Think

- Requirements artifact: `docs/brainstorms/2026-04-07-proof-coverage-scope-expansion-requirements.md`

### Design

- Design run manifest: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-design-run-manifest.md`
- Approved design: `docs/designs/2026-04-07-proof-coverage-scope-expansion-design.md`
- Engineering challenge: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-engineering-design-challenge.md`
- Operations challenge: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-ops-design-challenge.md`
- Design synthesis: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-design-synthesis.md`

### Plan

- Plan run manifest: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-plan-run-manifest.md`
- Research summary: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-research-summary.md`
- Implementation plan: `docs/plans/2026-04-07-proof-coverage-scope-expansion-plan.md`
- Plan critique input: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-plan-critique-input.md`
- Design consistency review: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-design-consistency-review.md`
- Engineering feasibility review: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-engineering-feasibility-review.md`
- Scope and risk review: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-scope-risk-review.md`
- Critique summary: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-plan-critique-summary.md`

### Work

- Work manifest: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-work-run-manifest.md`
- Scope expansion request: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-request.md`
- Verification evidence: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-verification.md`
- System interaction check: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-system-interaction-check.md`
- Spec compliance review: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-spec-compliance-review.md`
- Code quality review: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-code-quality-review.md`
- Execution report: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-execution-report.md`

### Review

- Review run manifest: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-review-run-manifest.md`
- Review context: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-review-context.md`
- Product review: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-product-review.md`
- Engineering review: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-engineering-review.md`
- Operations review: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-ops-review.md`
- Review synthesizer input: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-review-synthesizer-input.md`
- Final review: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-final-review.md`

### Compound

- Compound run manifest: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-compound-run-manifest.md`
- Trigger checklist: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-trigger-checklist.md`
- Compound context: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-compound-context.md`
- Product curator: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-product-curator.md`
- Engineering curator: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-engineer-curator.md`
- Operations curator: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-ops-curator.md`
- Compound synthesizer input: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-compound-synthesizer-input.md`
- Compound decision: `docs/architecture/2026-04-07-proof-coverage-scope-expansion-compound-decision.md`

## What This Example Proved

- `cmon:work` can stop when the original file boundary is no longer sufficient.
- a narrow scope expansion can be recorded explicitly and kept reviewable.
- scope growth does not automatically mean the unit must return to planning if the unit goal is still unchanged.

## What It Still Does Not Prove

- It does not yet prove a fully blocked execution path.
- It does not yet prove the same compound behavior on a less documentation-heavy task.
