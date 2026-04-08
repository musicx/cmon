# cmon Verification Positioning v0

Date: 2026-04-08
Status: Draft

This document records the current `cmon` decision about verification.

## Current Judgment

Dogfooding changed the earlier position.

`cmon` now needs an explicit `verify` stage.

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

It remains embedded inside bounded execution, but that is no longer sufficient as the only explicit acceptance gate.

### `cmon:verify`

`cmon:verify` should now be the default post-work stage.

Its job is to explicitly judge whether the work evidence actually supports the implementation claim.

### `cmon:review`

`cmon:review` remains useful, but it should now be treated as a broader optional audit stage after verification when additional product / operations / engineering scrutiny is warranted.

### `cmon:pressure-test`

`cmon:pressure-test` is better understood as a pre-work artifact review gate than as the answer to post-work verification.

## Decision

Add `cmon:verify` as the default post-work stage.

Reason:

- dogfooding showed that post-work acceptance needs a clearer explicit gate
- broader multi-lens review should not be the default answer to every completed work unit
- pre-work critique and post-work verification should be distinguished more clearly

The corrected design is:

- execution must still gather evidence
- verify is the default explicit post-work acceptance stage
- review is the optional broader audit stage
- pressure-test is the explicit pre-work artifact review gate

## Future Option

`cmon:verify` should be lighter than `cmon:review` and narrower than `cmon:work`.

The likely use cases would be:

- code has not changed much, but verification needs to be rerun or recaptured
- an operator wants a verification-focused pass before broader review
- multiple evidence sources need to be normalized into one compact verification packet

## Conditions For Adding `cmon:verify`

The dogfooding evidence has now been met:

- verification was needed as a distinct post-work step
- `cmon:review` was being used to catch issues that should have been separated from broader audit
- `cmon:pressure-test` was too ambiguously positioned to serve as the post-work answer

## Conclusion

For the corrected version of `cmon`:

- verification is now explicit
- `cmon:work` gathers evidence
- `cmon:verify` judges post-work sufficiency
- `cmon:review` adds broader audit only when justified

## Related

- `docs/architecture/2026-04-07-work-execution-v0.md`
- `docs/architecture/2026-04-07-work-review-loop-v0.md`
- `docs/architecture/2026-04-07-review-execution-v0.md`
- `docs/architecture/2026-04-07-thin-critique-orchestration-v0.md`
- `docs/architecture/2026-04-08-verify-skill-v0.md`
