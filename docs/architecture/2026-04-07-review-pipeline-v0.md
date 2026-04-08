# cmon Review Pipeline v0

Date: 2026-04-07
Status: Draft

Legacy note: this pipeline now exists mainly for deprecated `cmon:review` compatibility.
The canonical main chain uses `cmon:challenge` for pre-work multi-lens challenge and `cmon:verify` for post-work engineering acceptance.

This document defines the first review pipeline for `cmon`.

It exists so that `cmon:review` can dispatch multiple reviewers and still get deterministic, mergeable output.

## 1. Review Participants

The v0 review pipeline consists of:

- `product-reviewer`
- `engineer-reviewer`
- `ops-reviewer`
- `review-synthesizer`

## 2. Review Inputs

When available, every reviewer should receive:

1. the diff
2. the approved requirements/design artifact
3. the approved implementation plan
4. verification evidence from `cmon:work`
5. verification summary from `cmon:verify` when one exists
6. execution-boundary artifacts from `cmon:work`, especially a scope expansion request when present

This is a core `cmon` design rule.

Reviewing the diff alone is insufficient for meaningful acceptance.

## 3. Reviewer Responsibilities

### Product Reviewer

Checks:

- problem alignment
- scope drift
- missing requirement slices
- over-built or under-built behavior

### Engineer Reviewer

Checks:

- correctness
- implementation boundaries
- maintainability
- adequacy of tests and verification

### Ops Reviewer

Checks:

- runtime and rollout risk
- configuration assumptions
- retries, idempotency, migration, and partial failure behavior

### Review Synthesizer

Checks:

- overlap between findings
- disagreements
- merged action list
- final review decision

## 4. Shared Finding Schema

All primary reviewers should express findings using the same core fields:

- `Finding`
- `Severity`
- `Action Class`
- `Owner`
- `Confidence`
- `Why It Matters`
- `Evidence`
- `Recommended Action`

This is a markdown schema in v0, not JSON.

## 5. Severity Scale

- `P0`
  - critical issue, should block acceptance

- `P1`
  - major issue, likely requires fixes before acceptance

- `P2`
  - meaningful but narrower issue

- `P3`
  - minor improvement suggestion

## 6. Action Classes

- `safe_auto`
  - low-risk, unambiguous fix
  - expected mostly from engineering review

- `gated`
  - likely correct, but requires explicit behavior or scope decision

- `manual`
  - larger redesign or judgment call needed

- `advisory`
  - worth noting, not blocking

## 7. Ownership Values

For v0, keep owner values simple:

- `cmon:work`
  - the normal implementation loop should resolve it

- `human`
  - requires explicit human decision or acceptance

## 8. Merge Rules

The synthesizer must:

1. merge duplicates by underlying issue, not exact wording
2. keep the more conservative severity on disagreement
3. keep the more conservative action class on disagreement
4. preserve lens-specific reasoning in the merged output

## 9. Scope Check

The top of every synthesized review must include a scope check:

- `on_target`
- `drift`
- `incomplete`

This reflects alignment with the approved problem and plan, not just technical correctness.

## 10. Final Decisions

The final synthesized review uses one of:

- `accepted`
- `accepted_with_followup`
- `requires_fixes`

## 11. Operational Status

The pipeline now has the minimum artifacts needed to operate at the prompt and template layer:

- reviewer prompts for `product`, `engineering`, `operations`, and synthesis
- a shared review context bundle template
- a synthesizer input template
- a lens reviewer invocation template
- an execution-flow document for `cmon:review`

So `cmon:review` is now operational in design terms, even though there is not yet a dedicated runner helper or automation script.

## 12. Next Useful Upgrade

The next useful upgrade is one of:

- a manual operating procedure that uses the helper manifest and review templates directly
- a lightweight local script that assembles inputs and renders the review packets consistently
- direct handoff from synthesized review output into `cmon:work`
