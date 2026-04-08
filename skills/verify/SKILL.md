---
name: cmon:verify
description: Use after `cmon:work` to judge whether the implementation claim is actually supported by fresh evidence, and to route the result to completion, more work, or broader review.
---

# cmon:verify

Verify implementation claims before treating the unit as accepted.

This is the default post-work stage for substantial implementation.

## Purpose

`cmon:verify` exists to make one thing explicit:

- implementation is not accepted just because code was written and some evidence exists

It checks whether the evidence is actually strong enough.

## Inputs

Use:

- `templates/verify/verify-run-manifest-template.md`
- `templates/verify/verification-summary-template.md`

Default inputs:

- work execution report
- verification evidence
- system interaction check when relevant
- scope expansion request when relevant

## Core Questions

This skill should answer:

1. what exact claim is being verified
2. what evidence supports it
3. what remains unproven
4. whether the unit should return to work, stop as accepted, or escalate to broader review

## Non-Goals

Do not use this skill to:

- replace `cmon:work`
- rerun plan critique
- become a general product / engineering / operations review

## Typical Handoffs

Use:

- `templates/workflow/stage-transition-decision-template.md`

Typical transitions:

- `proceed -> cmon:compound`
  - when the unit is sufficiently verified and no broader audit is needed

- `revise -> cmon:work`
  - when evidence is weak, stale, incomplete, or misaligned with the claim

- `proceed -> cmon:review`
  - when verification is adequate but the change still deserves broader multi-lens scrutiny

## Related

- `docs/architecture/2026-04-08-verify-skill-v0.md`
- `docs/architecture/2026-04-08-verify-execution-v0.md`
- `docs/architecture/2026-04-08-verify-operating-procedure-v0.md`
