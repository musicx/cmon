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
9. whether the unit should return to work or stop as accepted

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

## Typical Handoffs

Use:

- `templates/workflow/stage-transition-decision-template.md`

Typical transitions:

- `proceed -> cmon:compound`
  - when the unit is sufficiently verified and accepted

- `revise -> cmon:work`
  - when evidence is weak, stale, incomplete, misaligned with the claim, or the implementation violates the approved plan/design or engineering bar

## Related

- `docs/architecture/2026-04-08-verify-skill-v0.md`
- `docs/architecture/2026-04-08-verify-execution-v0.md`
- `docs/architecture/2026-04-08-verify-operating-procedure-v0.md`
