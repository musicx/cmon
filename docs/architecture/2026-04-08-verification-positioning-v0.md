# cmon Verification Positioning v0

Date: 2026-04-08
Status: Draft

This document records the current `cmon` decision about verification.

## Current Judgment

`cmon` does already cover verification.

It does **not** currently expose verification as a separate canonical skill or lifecycle stage.

That is intentional for now.

## Where Verification Already Lives

### `cmon:work`

Verification is already a required part of execution.

Current `cmon:work` requires:

- fresh verification evidence
- explicit verification targets
- system interaction checks when effects are non-local
- internal spec-compliance review
- internal code-quality review

So verification is not missing from the framework.

It is embedded inside bounded execution.

### `cmon:review`

`cmon:review` treats verification evidence as part of the review input contract.

This means review is not just looking at code diffs.

It is also checking whether the implementation was actually supported by evidence.

### `cmon:pressure-test`

`cmon:pressure-test` can lightly cover readiness and handoff quality when a narrower gate is useful.

This makes it the current best auxiliary surface for lightweight verification-like checks without invoking a full multi-lens review.

## Decision

Do **not** add verification as a new mandatory lifecycle stage right now.

Do **not** split verification out of `cmon:work`.

Reason:

- it would overlap heavily with existing `cmon:work` behavior
- it would also partially overlap with `cmon:review`
- and it would risk turning one concept into multiple competing entry points too early

The current design is simpler:

- execution must verify
- review must consume verification evidence
- pressure-test may add a lighter readiness gate when needed

## Future Option

A lightweight auxiliary skill such as `cmon:verify` may still become useful later.

If added, it should be:

- auxiliary, not canonical
- lighter than `cmon:review`
- narrower than `cmon:work`

The likely use cases would be:

- code has not changed much, but verification needs to be rerun or recaptured
- an operator wants a verification-focused pass before broader review
- multiple evidence sources need to be normalized into one compact verification packet

## Conditions For Adding `cmon:verify`

Only add a separate `cmon:verify` if dogfooding shows repeated friction in cases like:

- verification is needed without re-running the full `cmon:work` posture
- verification is needed before `cmon:review`, but `cmon:pressure-test` is too abstract
- operators repeatedly build ad hoc verification packets outside the existing workflow

If those patterns do not recur, keep verification where it is now.

## Conclusion

For the current version of `cmon`:

- verification is covered
- it is intentionally distributed across `cmon:work`, `cmon:review`, and `cmon:pressure-test`
- a standalone `cmon:verify` is optional future refinement, not current framework debt

## Related

- `docs/architecture/2026-04-07-work-execution-v0.md`
- `docs/architecture/2026-04-07-work-review-loop-v0.md`
- `docs/architecture/2026-04-07-review-execution-v0.md`
- `docs/architecture/2026-04-07-thin-critique-orchestration-v0.md`
