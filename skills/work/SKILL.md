---
name: cmon:work
description: Use to execute an approved implementation unit within explicit boundaries. Enforces scoped implementation, fresh verification, and no-drift execution.
---

# cmon:work

Implement approved work without drifting beyond the plan.

This skill is intentionally more restrictive than a generic coding workflow.

Its job is not to "see what happens." Its job is to execute against approved boundaries and return with evidence.

## Preconditions

Do not use this skill unless one of these exists:

- an approved plan in `docs/plans/`
- a clearly approved, tightly bounded work unit derived from that plan

If neither exists, go back to `cmon:plan`.

## Required Inputs

Before implementation starts, identify:

1. The plan or work unit being executed
2. The originating requirements and design artifacts when relevant
3. Files or modules in scope
4. Explicit constraints
5. Patterns to follow
6. Verification target
7. Stop condition

Use `templates/work/work-run-manifest-template.md` as the default way to lock the unit before coding when the execution boundary needs to be made explicit.

## Workflow

1. Read the relevant implementation unit critically
2. Lock the current unit boundary
3. Inspect the affected files, referenced patterns, and nearby tests
4. Honor the unit's `Execution Note` when one exists
5. Implement only what the unit requires
6. If scope expansion appears necessary, stop and record it explicitly
7. Verify the unit with explicit evidence
8. Run a direct self-review for plan drift, edge cases, and missing coverage
9. Record any findings that affect later units or require review
10. Produce a clean handoff package for `cmon:review`

## Execution Posture

The plan is a decision artifact, not a script.

`cmon:work` must:

- treat requirements, design, and plan boundaries as the source of truth
- honor `Execution Note` when a unit is marked test-first or characterization-first
- prefer existing patterns before inventing new structure

If the unit is missing detail that blocks responsible execution, stop and return to `cmon:plan`.

## Execution Rules

- Only edit files that are in scope for the current unit, unless a narrow dependency forces expansion
- If scope expansion is required, use `templates/work/scope-expansion-request-template.md` and stop unless the expansion is narrow, justified, and recorded
- Prefer the smallest change that satisfies the unit
- Do not mix unrelated cleanup into the same unit
- Do not silently reinterpret requirements or design intent during execution

## Verification Rules

Completion requires evidence from this session.

Acceptable evidence includes:

- targeted test output
- build output
- reproducible command output
- focused manual verification steps when automation is not practical

Use `templates/work/verification-evidence-template.md` as the default structure when evidence needs to be captured explicitly.

Unacceptable completion language:

- "should work now"
- "probably fixed"
- "done" without evidence

If the plan's test scenarios are obviously incomplete for the unit, supplement them before claiming completion. Do not pretend the missing cases do not exist.

## Output

For each executed unit, report:

- `Implemented`
- `Files changed`
- `Requirements / Design trace`
- `Verification`
- `Open findings for review`

Use `templates/work/unit-execution-report-template.md` as the default handoff structure.

## Hard Rules

- No unbounded implementation
- No claim of completion without evidence
- No hidden scope expansion
- No hiding plan gaps behind "reasonable assumptions"
- No jumping to adjacent units without closing the current one

## Handoff

After implementation of a meaningful unit:

- move to `cmon:review`

If the unit produced reusable learning:

- follow review with `cmon:compound`

If the unit boundary breaks and cannot be resolved narrowly:

- return to `cmon:plan`
