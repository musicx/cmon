---
name: cmon:pressure-test
description: Use to run the right thin critique stack for a stage artifact or handoff target, then return one merged readiness decision without introducing a runtime-heavy orchestrator.
---

# cmon:pressure-test

Run the smallest useful critique orchestration for an existing `cmon` artifact.

This is an auxiliary workflow skill.

It is not a core stage, but it now serves as the default pre-work review gate for substantial plan-level readiness.

## Purpose

`cmon` already has multiple critique surfaces:

- design challenge
- plan critique
- work internal review
- review synthesis

This skill provides one thin entry point that:

- selects the right critique surface
- keeps invocation structure consistent
- returns one readiness decision using the shared stage transition contract

## When to Use

Use this skill when you already have a stage artifact and want one explicit pressure-test pass before proceeding.

Typical uses:

- pressure-test a design artifact before planning
- pressure-test a plan before work
- pressure-test a work handoff package before broader review
- pressure-test whether a review packet is strong enough to judge

For substantial implementation work, the plan-before-work use is the default case, not an edge case.

## Non-Goals

Do not use this skill to:

- replace `cmon:design`, `cmon:plan`, `cmon:work`, or `cmon:review`
- invent a new runtime coordinator
- perform fresh repo exploration that should have happened in `cmon:understand`
- hide missing upstream artifacts behind a fake readiness decision

## Inputs

Use:

- `templates/workflow/pressure-test-run-manifest-template.md`

Minimum inputs:

1. stage under test
2. primary artifact path
3. expected next stage
4. context artifacts already available
5. known gaps or risks

## Routing

### `design`

Run the owner-led challenge surface already defined by `cmon:design`:

- challenge invocation template
- design synthesizer input
- design synthesizer

Return one `proceed / revise / block` decision for the transition into `cmon:plan`.

### `plan`

Run the existing pre-work critique stack already defined by `cmon:plan`:

- design consistency review
- engineering feasibility review
- scope risk review
- critique summary merge

Return one `proceed / revise / block` decision for the transition into `cmon:work`.


### `work`

Run the existing narrow internal review surface already defined by `cmon:work`:

- spec compliance review
- code-quality review

Return one `proceed / revise / block` decision for the transition into `cmon:verify` or, when explicitly warranted, `cmon:review`.

### `review`

Validate whether the review packet is complete enough to judge, then use the existing review synthesis surface.

Return one `proceed / revise / block` decision for:

- `cmon:compound`
- `complete`
- or back to `cmon:work`

## Output

Use:

- `templates/workflow/pressure-test-summary-template.md`
- `templates/workflow/stage-transition-decision-template.md`

The result should state:

- what was pressure-tested
- what critique surfaces were used
- key findings
- the merged readiness decision

## Hard Rules

- Do not create a new critique persona matrix when an existing stage-specific one already exists
- Do not widen the tested scope silently
- Do not return `proceed` when required artifacts are missing in a way that undermines the judgment
- Do not turn this skill into a general review substitute

## Handoff

The output of `cmon:pressure-test` is a decision aid for the next real stage.

Typical transition targets:

- back to the same stage with `revise`
- forward to the next stage with `proceed`
- upstream or stop with `block`

Operational references:

- `docs/architecture/2026-04-07-pressure-test-execution-v0.md`
- `docs/architecture/2026-04-07-pressure-test-operating-procedure-v0.md`
- `docs/architecture/2026-04-07-auxiliary-skill-invocation-policy-v0.md`
