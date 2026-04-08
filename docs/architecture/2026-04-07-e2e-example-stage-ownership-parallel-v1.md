# cmon End-to-End Example: Stage Ownership Parallel v1

Date: 2026-04-07
Status: Draft

This document records a new end-to-end example run for `cmon`.

Its purpose is narrower than the earlier richer routing-matrix example:

- prove that `cmon:work` can legitimately choose `parallel`
- prove that the choice stays bounded because write scopes are truly disjoint
- prove that merged review can still judge the result as one coherent unit

## Example Task

Add a compact stage-ownership routing reference and surface it across the minimum repo surfaces operators actually use.

## Artifact Chain

### Understand

- Context packet: `docs/architecture/2026-04-07-stage-ownership-parallel-understand-packet.md`

### Think

- Requirements artifact: `docs/brainstorms/2026-04-07-stage-ownership-parallel-requirements.md`

### Design

- Design run manifest: `docs/architecture/2026-04-07-stage-ownership-parallel-design-run-manifest.md`
- Approved design: `docs/designs/2026-04-07-stage-ownership-parallel-design.md`
- Engineering challenge: `docs/architecture/2026-04-07-stage-ownership-parallel-engineering-design-challenge.md`
- Operations challenge: `docs/architecture/2026-04-07-stage-ownership-parallel-ops-design-challenge.md`
- Design synthesis: `docs/architecture/2026-04-07-stage-ownership-parallel-design-synthesis.md`

### Plan

- Plan run manifest: `docs/architecture/2026-04-07-stage-ownership-parallel-plan-run-manifest.md`
- Research summary: `docs/architecture/2026-04-07-stage-ownership-parallel-research-summary.md`
- Implementation plan: `docs/plans/2026-04-07-stage-ownership-parallel-plan.md`
- Plan critique input: `docs/architecture/2026-04-07-stage-ownership-parallel-plan-critique-input.md`
- Design consistency review: `docs/architecture/2026-04-07-stage-ownership-parallel-design-consistency-review.md`
- Engineering feasibility review: `docs/architecture/2026-04-07-stage-ownership-parallel-engineering-feasibility-review.md`
- Scope and risk review: `docs/architecture/2026-04-07-stage-ownership-parallel-scope-risk-review.md`
- Critique summary: `docs/architecture/2026-04-07-stage-ownership-parallel-plan-critique-summary.md`

### Work

- Work manifest: `docs/architecture/2026-04-07-stage-ownership-parallel-work-run-manifest.md`
- Execution strategy: `docs/architecture/2026-04-07-stage-ownership-parallel-execution-strategy.md`
- Verification evidence: `docs/architecture/2026-04-07-stage-ownership-parallel-verification.md`
- System interaction check: `docs/architecture/2026-04-07-stage-ownership-parallel-system-interaction-check.md`
- Spec compliance review: `docs/architecture/2026-04-07-stage-ownership-parallel-spec-compliance-review.md`
- Code quality review: `docs/architecture/2026-04-07-stage-ownership-parallel-code-quality-review.md`
- Execution report: `docs/architecture/2026-04-07-stage-ownership-parallel-execution-report.md`

### Review

- Review run manifest: `docs/architecture/2026-04-07-stage-ownership-parallel-review-run-manifest.md`
- Review context: `docs/architecture/2026-04-07-stage-ownership-parallel-review-context.md`
- Product review: `docs/architecture/2026-04-07-stage-ownership-parallel-product-review.md`
- Engineering review: `docs/architecture/2026-04-07-stage-ownership-parallel-engineering-review.md`
- Operations review: `docs/architecture/2026-04-07-stage-ownership-parallel-ops-review.md`
- Review synthesizer input: `docs/architecture/2026-04-07-stage-ownership-parallel-review-synthesizer-input.md`
- Final review: `docs/architecture/2026-04-07-stage-ownership-parallel-final-review.md`

### Compound

- Compound run manifest: `docs/architecture/2026-04-07-stage-ownership-parallel-compound-run-manifest.md`
- Trigger checklist: `docs/architecture/2026-04-07-stage-ownership-parallel-trigger-checklist.md`
- Compound context: `docs/architecture/2026-04-07-stage-ownership-parallel-compound-context.md`
- Product curator: `docs/architecture/2026-04-07-stage-ownership-parallel-product-curator.md`
- Engineering curator: `docs/architecture/2026-04-07-stage-ownership-parallel-engineer-curator.md`
- Operations curator: `docs/architecture/2026-04-07-stage-ownership-parallel-ops-curator.md`
- Compound synthesizer input: `docs/architecture/2026-04-07-stage-ownership-parallel-compound-synthesizer-input.md`
- Compound decision: `docs/architecture/2026-04-07-stage-ownership-parallel-compound-decision.md`

## What This Example Proved

- `parallel` can be valid in `cmon:work` when the sub-steps write to truly disjoint surfaces.
- `parallel` does not need a runtime-heavy orchestrator to be reasoned about clearly.
- a docs-first proof case is enough to validate the policy, even if a later code-changing example may still be useful.

## What It Still Does Not Prove

- It does not yet prove a blocked or scope-expansion path.
- It does not yet prove the same `parallel` discipline on a code-changing task.
