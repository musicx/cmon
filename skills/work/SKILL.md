---
name: cmon:work
description: Use to execute an approved plan within explicit boundaries. Enforces scoped implementation, verification, and no-drift execution.
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
2. Files or modules in scope
3. Explicit constraints
4. Verification target
5. Stop condition

Use `templates/work/work-run-manifest-template.md` as the default way to lock the unit before coding when the execution boundary needs to be made explicit.

## Workflow

1. Read the relevant implementation unit
2. Lock the current unit boundary
3. Inspect the affected files and nearby tests
4. Implement only what the unit requires
5. If scope expansion appears necessary, stop and record it explicitly
6. Verify the unit with explicit evidence
7. Record any findings that affect later units or require review
8. Produce a clean handoff package for `cmon:review`

## Execution Rules

- Only edit files that are in scope for the current unit, unless a narrow dependency forces expansion
- If scope expansion is required, use `templates/work/scope-expansion-request-template.md` and stop unless the expansion is narrow, justified, and recorded
- Prefer the smallest change that satisfies the unit
- Do not mix unrelated cleanup into the same unit

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

## Output

For each executed unit, report:

- `Implemented`
- `Files changed`
- `Verification`
- `Open findings for review`

Use `templates/work/unit-execution-report-template.md` as the default handoff structure.

## Hard Rules

- No unbounded implementation
- No claim of completion without evidence
- No hidden scope expansion
- No jumping to adjacent units without closing the current one

## Handoff

After implementation of a meaningful unit:

- move to `cmon:review`

If the unit produced reusable learning:

- follow review with `cmon:compound`

If the unit boundary breaks and cannot be resolved narrowly:

- return to `cmon:plan`
