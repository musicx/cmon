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

### `cmon:challenge`

The pre-work multi-role challenge should happen before implementation, not after it.

## Decision

Add `cmon:verify` as the default post-work engineering review stage.

Reason:

- dogfooding showed that post-work acceptance needs a clearer explicit gate
- the earlier multi-role review concern belongs before `cmon:work`
- pre-work challenge and post-work verification should be distinguished more clearly

The corrected design is:

- execution must still gather evidence
- challenge is the explicit pre-work multi-role gate
- verify is the default explicit post-work code-review and acceptance stage

`verify` should now be strengthened with:

- verification depth
- hard stops
- conditional specialist escalation

## Future Option

`cmon:verify` should be narrower than `cmon:work` and focused on post-work implementation review rather than pre-work scope challenge.

The likely use cases would be:

- code has not changed much, but verification needs to be rerun or recaptured
- an operator wants a verification-focused pass before broader review
- multiple evidence sources need to be normalized into one compact verification packet

## Conditions For Adding `cmon:verify`

The dogfooding evidence has now been met:

- verification was needed as a distinct post-work step
- the earlier review-like challenge belonged before implementation
- `cmon:pressure-test` was too ambiguous and should be replaced by `cmon:challenge`

## Conclusion

For the corrected version of `cmon`:

- verification is now explicit
- `cmon:work` gathers evidence
- `cmon:challenge` tests proposed design / plan artifacts before implementation
- `cmon:verify` judges post-work implementation sufficiency, plan alignment, and engineering quality

## Related

- `docs/architecture/2026-04-07-work-execution-v0.md`
- `docs/architecture/2026-04-07-work-review-loop-v0.md`
- `docs/architecture/2026-04-08-challenge-skill-v0.md`
- `docs/architecture/2026-04-08-verify-skill-v0.md`
- `docs/architecture/2026-04-08-verify-depth-and-hard-stops-v0.md`
