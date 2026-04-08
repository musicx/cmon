# cmon End-to-End Example: Routing Matrix Refresh v1

Date: 2026-04-07
Status: Draft

This document records a richer end-to-end example run for `cmon`.

Unlike the original routing-matrix example, this one explicitly exercises:

- `cmon:design`
- `cmon:plan` critique
- `cmon:work` execution strategy selection
- `cmon:work` system interaction checks
- `cmon:compound` update-existing behavior

## Example Task

Refresh the operator-facing workflow references so they reflect the mature `plan` and `work` contracts without changing lifecycle shape.

## Artifact Chain

### Understand

- Context packet: `docs/architecture/2026-04-07-routing-matrix-refresh-understand-packet.md`

### Think

- Requirements artifact: `docs/brainstorms/2026-04-07-routing-matrix-refresh-requirements.md`

### Design

- Design run manifest: `docs/architecture/2026-04-07-routing-matrix-refresh-design-run-manifest.md`
- Approved design: `docs/designs/2026-04-07-routing-matrix-refresh-design.md`
- Engineering challenge: `docs/architecture/2026-04-07-routing-matrix-refresh-engineering-design-challenge.md`
- Operations challenge: `docs/architecture/2026-04-07-routing-matrix-refresh-ops-design-challenge.md`
- Design synthesis: `docs/architecture/2026-04-07-routing-matrix-refresh-design-synthesis.md`

### Plan

- Plan run manifest: `docs/architecture/2026-04-07-routing-matrix-refresh-plan-run-manifest.md`
- Research summary: `docs/architecture/2026-04-07-routing-matrix-refresh-research-summary.md`
- Implementation plan: `docs/plans/2026-04-07-routing-matrix-refresh-plan.md`
- Plan critique input: `docs/architecture/2026-04-07-routing-matrix-refresh-plan-critique-input.md`
- Design consistency review: `docs/architecture/2026-04-07-routing-matrix-refresh-design-consistency-review.md`
- Engineering feasibility review: `docs/architecture/2026-04-07-routing-matrix-refresh-engineering-feasibility-review.md`
- Scope and risk review: `docs/architecture/2026-04-07-routing-matrix-refresh-scope-risk-review.md`
- Critique summary: `docs/architecture/2026-04-07-routing-matrix-refresh-plan-critique-summary.md`

### Work

- Work manifest: `docs/architecture/2026-04-07-routing-matrix-refresh-work-run-manifest.md`
- Execution strategy: `docs/architecture/2026-04-07-routing-matrix-refresh-execution-strategy.md`
- Verification evidence: `docs/architecture/2026-04-07-routing-matrix-refresh-verification.md`
- System interaction check: `docs/architecture/2026-04-07-routing-matrix-refresh-system-interaction-check.md`
- Spec compliance review: `docs/architecture/2026-04-07-routing-matrix-refresh-spec-compliance-review.md`
- Code quality review: `docs/architecture/2026-04-07-routing-matrix-refresh-code-quality-review.md`
- Execution report: `docs/architecture/2026-04-07-routing-matrix-refresh-execution-report.md`

### Review

- Review run manifest: `docs/architecture/2026-04-07-routing-matrix-refresh-review-run-manifest.md`
- Review context: `docs/architecture/2026-04-07-routing-matrix-refresh-review-context.md`
- Product review: `docs/architecture/2026-04-07-routing-matrix-refresh-product-review.md`
- Engineering review: `docs/architecture/2026-04-07-routing-matrix-refresh-engineering-review.md`
- Operations review: `docs/architecture/2026-04-07-routing-matrix-refresh-ops-review.md`
- Review synthesizer input: `docs/architecture/2026-04-07-routing-matrix-refresh-review-synthesizer-input.md`
- Final review: `docs/architecture/2026-04-07-routing-matrix-refresh-final-review.md`

### Compound

- Compound run manifest: `docs/architecture/2026-04-07-routing-matrix-refresh-compound-run-manifest.md`
- Trigger checklist: `docs/architecture/2026-04-07-routing-matrix-refresh-trigger-checklist.md`
- Compound context: `docs/architecture/2026-04-07-routing-matrix-refresh-compound-context.md`
- Product curator: `docs/architecture/2026-04-07-routing-matrix-refresh-product-curator.md`
- Engineering curator: `docs/architecture/2026-04-07-routing-matrix-refresh-engineer-curator.md`
- Operations curator: `docs/architecture/2026-04-07-routing-matrix-refresh-ops-curator.md`
- Compound synthesizer input: `docs/architecture/2026-04-07-routing-matrix-refresh-compound-synthesizer-input.md`
- Compound decision: `docs/architecture/2026-04-07-routing-matrix-refresh-compound-decision.md`

## What This Example Proved

- `cmon:design` can materially shape planning scope by forcing parity across workflow surfaces.
- `cmon:plan` critique can catch a weak first draft and tighten the unit before work begins.
- `cmon:work` can run with explicit `serial` strategy rather than vague delegation.
- `cmon:work` system interaction checks are meaningful even in a docs-heavy repo when workflow truth is exposed through multiple operator-facing surfaces.

## What It Still Does Not Prove

- It does not yet prove `parallel` execution on a real disjoint-write example.
- It does not yet prove blocked execution or scope expansion in a richer code-changing scenario.
