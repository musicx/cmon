# cmon Verify Skill v0

Date: 2026-04-08
Status: Draft

This document defines the initial design correction for `cmon:verify`.

## Why This Exists

Dogfooding exposed a mismatch in the earlier workflow:

- plan and design quality checks were not prominent enough before implementation
- post-implementation flow was still conflating verification with a broader, older review concept

That made it too easy to discover implementation-adjacent problems only after code had already been written.

## Decision

`cmon` should make `verify` the default post-work stage.

The corrected shape is:

- design gets challenged before planning
- plan gets challenged before work
- work implements the approved unit
- verify checks whether implementation claims are actually supported
- verify itself becomes the default post-work engineering review and acceptance gate

## What `cmon:verify` Should Do

`cmon:verify` should:

- consume the work handoff package
- check that evidence really supports the implementation claim
- consolidate test/build/manual evidence into one explicit verification judgment
- decide whether the unit may stop or needs more work
- review whether the implementation still matches the approved plan and design
- enforce engineering quality such as correctness, safety, effectiveness, and simplicity

## What `cmon:verify` Should Not Do

It should not:

- re-run planning critique
- replace `cmon:work`
- become a multi-role pre-work challenge stage

## Relationship to Existing Skills

### `cmon:work`

`cmon:work` still gathers fresh evidence and runs internal execution checks.

`cmon:verify` is the explicit stage that judges whether that evidence is good enough to accept the implemented unit.

### `cmon:challenge`

`cmon:challenge` is the canonical pre-work multi-role stage.

It should handle design and plan challenge before code exists.

## Corrected Lifecycle

For substantial implementation work, the default path should now be:

```text
cmon:understand -> cmon:think -> cmon:design -> cmon:plan -> cmon:challenge -> cmon:work -> cmon:verify -> cmon:compound
```

## Related

- `docs/architecture/2026-04-08-verification-positioning-v0.md`
- `docs/architecture/2026-04-07-core-skills-v0.md`
- `docs/architecture/2026-04-07-auxiliary-skill-invocation-policy-v0.md`
