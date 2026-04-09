---
name: cmon:challenge
description: Use after `cmon:design` or `cmon:plan` to run a multi-role pre-work challenge pass on the proposed solution before any implementation begins.
---

# cmon:challenge

Challenge the proposed solution before writing code.

`cmon:challenge` is the canonical pre-work multi-role gate for `cmon`.

It exists to test whether the current design or design+plan package should actually survive contact with product expectations, engineering reality, operational constraints, and human approval.

## Purpose

`cmon:challenge` should answer one narrow question:

- is the current proposed artifact strong enough to move to the next human approval gate

It is not a post-work code review stage.

## Challenge Modes

Every challenge pass must declare one canonical mode:

1. `design`
   - after `cmon:design`
   - before `human_design_approval`
   - challenges whether the design is clear and complete enough for human approval and planning

2. `package`
   - after `cmon:plan`
   - before `human_package_approval`
   - challenges whether design, Markdown plan, and execution JSON align well enough for human approval and implementation

Do not infer the mode silently.

If the mode is unclear, stop and clarify the challenge target.

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
- `templates/workflow/challenge-disposition-template.md`
- `templates/challenge/challenge-context-template.md`
- `templates/challenge/lens-invocation-template.md`
- `templates/challenge/lens-output-template.md`
- `templates/challenge/synthesizer-input-template.md`

Default inputs:

- approved requirements when relevant
- design artifact when one exists
- implementation plan when one exists
- execution JSON for `package` mode
- understand packet when local context materially shapes the proposal

The challenge pass should preserve:

- scope verdict
- structured findings
- raw per-lens challenge outputs
- explicit finding disposition after synthesis
- conservative merged routing

## Core Questions

This skill should answer:

1. what proposed artifact package is being challenged
2. what assumptions still look weak
3. what must be revised before implementation starts
4. whether the next stage should be `human_design_approval`, `human_package_approval`, return to `cmon:design`, or return to `cmon:plan`
5. whether scope is `on_target`, `drift`, or `incomplete`
6. how each accepted, deferred, or rejected finding was handled before implementation starts

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

- `proceed -> human_design_approval`
  - when `mode=design` and the design is strong enough for human approval

- `proceed -> human_package_approval`
  - when `mode=package` and the design / plan / execution JSON package is strong enough for human approval

- `revise -> cmon:design`
  - when behavior, flow, state, or boundary truth is still weak

- `revise -> cmon:plan`
  - when implementation units, boundaries, verification, or dependencies are still weak

- `block`
  - when upstream ambiguity is still too high for responsible execution

## Related

- `docs/architecture/2026-04-08-challenge-skill-v0.md`
- `docs/architecture/2026-04-08-challenge-execution-v0.md`
