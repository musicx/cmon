---
name: cmon:review
description: Deprecated compatibility alias. Use when an older workflow references cmon:review for pre-work multi-role solution challenge and redirect to cmon:challenge.
---

# cmon:review

Deprecated compatibility alias.

`cmon:review` is no longer the canonical stage name in the main chain.

The earlier multi-role review intent is now split into:

- `cmon:challenge`
  - pre-work multi-role challenge of design / plan artifacts

- `cmon:verify`
  - post-work implementation review against plan, evidence, and engineering quality bar

## Redirect

When an older workflow says `cmon:review`, interpret it as:

- `cmon:challenge`

unless the user explicitly asks for a legacy post-work broader audit, in which case explain that the current canonical post-work stage is `cmon:verify`.

## Related

- `skills/challenge/SKILL.md`
- `skills/verify/SKILL.md`
- `docs/architecture/2026-04-08-challenge-skill-v0.md`
- Do not synthesize by averaging reviewer opinions, use conservative merge rules
- Do not treat missing requirements, missing plans, or missing verification evidence as invisible
- Do not return raw reviewer outputs as the final review when synthesis is available

## Handoff

Record the handoff using:

- `templates/workflow/stage-transition-decision-template.md`

Typical transition decisions:

- `revise -> cmon:work`
  - if changes are required

If accepted and reusable learning was created:

- `proceed -> cmon:compound`

If accepted and no compounding is needed:

- `proceed -> complete`

If review cannot responsibly judge the target because the artifact set or evidence base is insufficient:

- `block`
