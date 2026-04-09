---
name: cmon:verify
description: Use after `cmon:work` to review the implemented change against the approved plan and design, verify the evidence, and enforce engineering quality before acceptance.
---

# cmon:verify

Verify implementation claims before treating the unit as accepted.

This is the default post-work stage for substantial implementation.

## Purpose

`cmon:verify` exists to make one thing explicit:

- implementation is not accepted just because code was written and some evidence exists

It should review the implemented change against:

- approved requirements and design intent
- approved implementation plan
- fresh verification evidence
- core engineering quality expectations such as correctness, safety, effectiveness, and simplicity
- git commit hygiene for the accepted unit

## Inputs

Use:

- `templates/verify/verify-run-manifest-template.md`
- `templates/verify/verification-summary-template.md`
- `templates/verify/hard-stop-checklist-template.md`
- `templates/verify/specialist-escalation-template.md`

Default inputs:

- work execution report
- diff when the changed code itself must be inspected
- approved plan
- approved design when relevant
- verification evidence
- system interaction check when relevant
- scope expansion request when relevant
- current git status and commit state

## Core Questions

This skill should answer:

1. what exact claim is being verified
2. what evidence supports it
3. what remains unproven
4. whether the implementation still matches the approved plan and design
5. whether the code meets the engineering bar for correctness, safety, effectiveness, and simplicity
6. whether any hard stop blocks acceptance
7. whether the verification depth should be quick, standard, or deep
8. whether specialist scrutiny is required before acceptance
9. whether the accepted unit has been committed or why commit is blocked
10. whether the unit should return to work or stop as accepted

## Non-Goals

Do not use this skill to:

- replace `cmon:work`
- rerun pre-work multi-role challenge
- become a generic product strategy or scope challenge stage

## Hard Stops

Treat these as hard stops:

- no fresh evidence
- claim / evidence mismatch
- missing approved plan or missing relevant design source
- unapproved plan or design drift
- required system-interaction proof missing
- regression fix without regression proof
- risk-sensitive change without matching scrutiny
- accepted implementation changes are not committed and no explicit commit blocker is recorded

## Git Commit Requirement

A verify pass is not complete when it accepts code but leaves the accepted changes uncommitted.

Before `proceed -> cmon:compound` or completion:

1. Run `git status`.
2. Confirm the accepted unit's intended files are staged or ready to stage.
3. Create a git commit for the accepted unit.
4. Record the commit hash in the verification summary.

If a commit cannot be created, do not silently proceed.
Record:

- why commit is blocked
- whether the blocker is user decision, dirty unrelated work, missing git repo, failed tests, or scope mismatch
- the exact next action required

Do not treat "verification passed" as complete without either a commit hash or an explicit commit blocker.

## Typical Handoffs

Use:

- `templates/workflow/stage-transition-decision-template.md`

Typical transitions:

- `proceed -> cmon:compound`
  - when the unit is sufficiently verified, accepted, and committed or has an explicit commit blocker recorded

- `revise -> cmon:work`
  - when evidence is weak, stale, incomplete, misaligned with the claim, or the implementation violates the approved plan/design or engineering bar

## Related

- `docs/architecture/2026-04-08-verify-skill-v0.md`
- `docs/architecture/2026-04-08-verify-execution-v0.md`
- `docs/architecture/2026-04-08-verify-operating-procedure-v0.md`
