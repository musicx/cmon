# cmon Plan Review Stack v0

Date: 2026-04-07
Status: Draft

This document defines the smaller pre-work critique stack that sits on top of `cmon:plan`.

It exists to tighten plans before `cmon:work` starts, without importing `gstack`'s heavier review runtime.

## 1. Why This Layer Exists

Research and deepening improve plan quality.

They do not fully replace adversarial critique.

Some planning failures only show up when the plan is challenged from outside the authoring posture:

- design assumptions that no longer match the approved behavior
- feasibility assumptions that break in the actual codebase
- scope or risk hidden by vague non-goals and vague deferrals

## 2. Stack Shape

The default critique stack is:

1. design consistency review
2. engineering feasibility review
3. scope and risk review

This stack is:

- pre-work, not post-implementation
- narrower than `cmon:review`
- smaller than `gstack/autoplan`

## 3. Design Consistency Review

Checks:

- design trace integrity
- flow and state preservation
- whether implementation units would force behavior invention later

Primary prompt:

- `agents/plan/design-consistency-reviewer.md`

## 4. Engineering Feasibility Review

Checks:

- implementation-unit realism
- dependency and sequencing realism
- file-scope and verification realism
- hidden execution blockers

Primary prompt:

- `agents/plan/engineering-feasibility-reviewer.md`

## 5. Scope And Risk Review

Checks:

- unjustified scope growth
- weak non-goals
- hidden or unmanaged risks
- fragile deferrals disguised as execution-owned questions

Primary prompt:

- `agents/plan/scope-risk-reviewer.md`

## 6. Core Artifacts

Use:

- `templates/plans/plan-critique-input-template.md`
- `templates/plans/plan-critique-summary-template.md`

## 7. Outcome Rules

If any reviewer returns material findings:

- revise the plan
- rerun the relevant critiques when needed
- do not proceed to `cmon:work` yet

If the merged critique summary says `ready_for_work`:

- move to `cmon:work`

## 8. Non-Goals

This stack does not:

- replace planning ownership
- create a multi-round approval bureaucracy
- auto-edit the plan in place
- subsume `cmon:review`

## 9. Reference Influence

This layer mainly borrows from `gstack`:

- critique pressure before coding
- explicit design and engineering review lenses
- raising quality through review, not only through richer templates

`cmon` intentionally keeps it smaller:

- no CEO or ambition-expansion lane in the default stack
- no large runtime wrapper
- no heavy interactive review choreography
