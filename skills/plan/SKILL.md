---
name: cmon:plan
description: Use after approved requirements or when behavior is already clear to define a bounded implementation plan with explicit scope, sequencing, constraints, and verification.
---

# cmon:plan

Define how approved work will be implemented.

`cmon:plan` should be strict enough to constrain execution, but not so script-like that it becomes implementation itself.

Its job is to produce a decision-quality implementation plan that gives `cmon:work` a safe boundary.

## Preconditions

Use this skill when one of these is true:

- `cmon:brainstorm` already produced an approved artifact
- the user provided sufficiently clear behavior, scope, and success criteria

If product behavior is still ambiguous, go back to `cmon:brainstorm`.

## Required Outputs

Produce a plan that includes:

1. Problem summary
2. Scope boundary and non-goals
3. Implementation units
4. Files or modules in scope per unit
5. Sequencing and dependencies
6. Verification expectations
7. Risks or deferred questions

Use `templates/plans/implementation-plan-template.md` as the default starting structure.

## Plan Philosophy

The plan is not implementation code.

It should answer:

- what gets changed
- in what order
- under what constraints
- how correctness will be checked

It should not try to pre-write all production code.

## Workflow

1. Read the approved requirements/design source
2. Re-read local repo constraints and patterns
3. Define a bounded set of implementation units
4. For each unit, specify:
   - goal
   - files or modules in scope
   - constraints
   - dependencies
   - verification
5. Identify what is explicitly out of scope
6. Write the plan to `docs/plans/`

## Implementation Unit Standard

Each implementation unit should be small enough to review, but large enough to matter.

Each unit must include:

- `Goal`
- `Scope`
- `Files`
- `Constraints`
- `Verification`
- `Done when`

## Hard Rules

- Do not silently expand scope beyond the approved artifact
- Do not omit verification expectations
- Do not produce a plan that leaves execution boundaries vague
- Do not move to code from this skill

## Handoff

The only normal next step is:

- `cmon:work`
