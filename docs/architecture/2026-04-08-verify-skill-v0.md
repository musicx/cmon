# cmon Verify Skill v0

Date: 2026-04-08
Status: Draft

This document defines the initial design correction for `cmon:verify`.

## Why This Exists

Dogfooding exposed a mismatch in the earlier workflow:

- plan and design quality checks were not prominent enough before implementation
- post-implementation flow defaulted too quickly toward `cmon:review`

That made it too easy to discover implementation-adjacent problems only after code had already been written.

## Decision

`cmon` should make `verify` the default post-work stage.

The corrected shape is:

- design gets challenged before planning
- plan gets pressure-tested before work
- work implements the approved unit
- verify checks whether implementation claims are actually supported
- review becomes an additional multi-lens audit for riskier or more consequential changes, not the default stage after every unit

## What `cmon:verify` Should Do

`cmon:verify` should:

- consume the work handoff package
- check that evidence really supports the implementation claim
- consolidate test/build/manual evidence into one explicit verification judgment
- decide whether the unit may stop, needs more work, or needs escalation to broader review

## What `cmon:verify` Should Not Do

It should not:

- re-run planning critique
- replace `cmon:work`
- replace `cmon:review`
- become a generic multi-lens code review stage

## Relationship to Existing Skills

### `cmon:work`

`cmon:work` still gathers fresh evidence and runs internal execution checks.

`cmon:verify` is the explicit stage that judges whether that evidence is good enough to accept the implemented unit.

### `cmon:pressure-test`

`cmon:pressure-test` should now be understood primarily as a pre-work artifact review gate, especially for plans and design-linked readiness.

It is not the default answer to post-work verification anymore.

### `cmon:review`

`cmon:review` remains valuable, but it should be used:

- when the change is risky
- when broader product / operations audit is warranted
- when the user explicitly wants a multi-lens post-implementation review

It is no longer the default immediate next stage after every work unit.

## Corrected Lifecycle

For substantial implementation work, the default path should now be:

```text
cmon:understand -> cmon:think -> cmon:design -> cmon:plan -> cmon:pressure-test -> cmon:work -> cmon:verify -> cmon:compound
```

And optionally:

```text
cmon:verify -> cmon:review
```

when the change needs broader scrutiny.

## Related

- `docs/architecture/2026-04-08-verification-positioning-v0.md`
- `docs/architecture/2026-04-07-core-skills-v0.md`
- `docs/architecture/2026-04-07-auxiliary-skill-invocation-policy-v0.md`
