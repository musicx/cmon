---
name: cmon:challenge
description: Use after `cmon:design` or `cmon:plan` to run a multi-role pre-work challenge pass on the proposed solution before any implementation begins.
---

# cmon:challenge

Challenge the proposed solution before writing code.

`cmon:challenge` is the canonical pre-work multi-role gate for `cmon`.

It exists to test whether the current design and plan should actually survive contact with product expectations, engineering reality, and operational constraints.

## Purpose

`cmon:challenge` should answer one narrow question:

- is the current proposed solution strong enough to begin implementation responsibly

It is not a post-work code review stage.

## Scope

This skill is intentionally limited to pre-implementation artifacts:

- `cmon:design` outputs
- `cmon:plan` outputs
- or one combined design-plus-plan package

Do not use this skill on implementation diffs or completed work.

## Required Lenses

Every meaningful challenge pass should cover:

- `Product`
  - does the design or plan still solve the right problem
  - is scope right-sized
  - does the intended behavior still make sense

- `Engineering`
  - are the boundaries implementable
  - are units, verification, and dependencies credible
  - is the plan hiding technical debt or execution ambiguity

- `Operations`
  - what breaks under rollout, config drift, retries, migration, or partial failure
  - what assumptions are unsafe before implementation starts

## Inputs

Use:

- `templates/workflow/challenge-run-manifest-template.md`
- `templates/workflow/challenge-summary-template.md`

Default inputs:

- approved requirements when relevant
- design artifact when one exists
- implementation plan when one exists
- understand packet when local context materially shapes the proposal

## Core Questions

This skill should answer:

1. what proposed artifact package is being challenged
2. what assumptions still look weak
3. what must be revised before implementation starts
4. whether the next stage should be `cmon:work`, return to `cmon:design`, or return to `cmon:plan`

## Non-Goals

Do not use this skill to:

- replace `cmon:work`
- review completed code
- become a generic repo review prompt
- invent a runtime-heavy orchestration layer

## Typical Handoffs

Use:

- `templates/workflow/stage-transition-decision-template.md`

Typical transitions:

- `proceed -> cmon:work`
  - when the challenged design/plan package is strong enough for bounded execution

- `revise -> cmon:design`
  - when behavior, flow, state, or boundary truth is still weak

- `revise -> cmon:plan`
  - when implementation units, boundaries, verification, or dependencies are still weak

- `block`
  - when upstream ambiguity is still too high for responsible execution

## Related

- `docs/architecture/2026-04-08-challenge-skill-v0.md`
- `docs/architecture/2026-04-08-challenge-execution-v0.md`

