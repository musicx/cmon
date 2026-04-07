---
name: cmon:plan
description: Use after approved requirements and design, or when behavior is already clear enough, to define a bounded implementation plan with explicit scope, sequencing, traceability, and verification.
---

# cmon:plan

Define how approved work will be implemented.

`cmon:plan` should be strict enough to constrain execution, but not so script-like that it becomes implementation itself.

Its job is to produce a decision-quality implementation plan that gives `cmon:work` a safe boundary.

## Preconditions

Use this skill when one of these is true:

- `cmon:think` already produced an approved requirements artifact
- `cmon:design` already produced an approved design artifact
- the user provided sufficiently clear behavior, scope, and success criteria

If product behavior or chosen direction is still ambiguous, go back to `cmon:think`.
If flow, state, or boundary design is still ambiguous, go back to `cmon:design`.

## Required Outputs

Produce a plan that includes:

1. Problem summary
2. Requirements and design trace
3. Scope boundary and non-goals
4. Implementation units
5. Files or modules in scope per unit
6. Sequencing and dependencies
7. Patterns to follow
8. Test scenarios and verification expectations
9. Risks or deferred questions

Use `templates/plans/implementation-plan-template.md` as the default starting structure.

## Plan Philosophy

The plan is not implementation code.

It should answer:

- what gets changed
- in what order
- under what constraints
- which existing patterns should be followed
- what must be tested
- how correctness will be checked

It should not try to pre-write all production code.

## Quality Bar

A plan is not ready unless:

- requirements and design decisions are traceable
- exact file paths are named
- every feature-bearing unit has concrete test scenarios
- execution boundaries are small enough to review cleanly
- no critical requirement is delegated to executor improvisation

## Workflow

1. Read the approved requirements source
2. Read the approved design source when one exists
3. Re-read local repo constraints, patterns, and prior learnings
4. Define a bounded set of implementation units
5. For each unit, specify:
   - goal
   - files or modules in scope
   - constraints
   - dependencies
   - patterns to follow
   - test scenarios
   - execution note when posture matters
   - verification
6. Identify what is explicitly out of scope
7. Run a self-check for coverage, placeholders, and vague tests
8. Write the plan to `docs/plans/`

## Implementation Unit Standard

Each implementation unit should be small enough to review, but large enough to matter.

Each unit must include:

- `Goal`
- `Requirements`
- `Scope`
- `Files`
- `Constraints`
- `Approach`
- `Patterns To Follow`
- `Test Scenarios`
- `Execution Note` when needed
- `Verification`
- `Done when`

## Hard Rules

- Do not silently expand scope beyond the approved artifact
- Do not omit verification expectations
- Do not omit test scenarios for feature-bearing work
- Do not produce a plan that leaves execution boundaries vague
- Do not invent missing design decisions that should have been resolved earlier
- Do not move to code from this skill

## Handoff

The only normal next step is:

- `cmon:work`
