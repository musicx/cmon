# Review Context Bundle

## Review Target

- Summary: newly added operator-facing routing matrix for the six core `cmon:*` skills
- Base Ref: `n/a - example artifact review`
- Scope Notes: single-doc review against approved requirements and plan

## Changed Files

- `docs/architecture/2026-04-07-core-skill-routing-matrix-v0.md`

## Diff

```diff
+ add one new architecture doc that summarizes the six core cmon skills in a routing matrix
+ add entry checks for understand/plan/review transitions
+ keep lifecycle order and naming unchanged
```

## Requirements Or Design Artifact

- Path: `docs/brainstorms/2026-04-07-core-skill-routing-matrix-requirements.md`
- Summary:
  - add one compact routing reference for the six core skills
  - preserve canonical lifecycle order and keep the change bounded

## Implementation Plan

- Path: `docs/plans/2026-04-07-core-skill-routing-matrix-plan.md`
- Summary:
  - implement one single-doc unit under `docs/architecture/`
  - do not expand into broad cross-linking or rewriting existing docs

## Verification Evidence

- `docs/architecture/2026-04-07-core-skill-routing-matrix-verification.md`

## Known Context Gaps

- discoverability outside this new doc was intentionally deferred
