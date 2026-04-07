# cmon Work Operating Procedure v0

Date: 2026-04-07
Status: Draft

This procedure describes how to execute one implementation unit using `cmon:work`.

It is intentionally manual-first.

The goal is to prove the workflow before adding any helper script.

## 1. Inputs

Before starting, collect:

- approved plan path
- chosen implementation unit
- relevant requirements reference
- nearby files and tests

Then create:

- `templates/work/work-run-manifest-template.md`

## 2. Step 1: Lock The Unit

Read the chosen implementation unit and restate:

- goal
- files in scope
- constraints
- verification
- done condition

If any of those are missing or vague, stop and return to:

- `cmon:plan`

Do not start coding from an underspecified unit.

## 3. Step 2: Fill The Work Run Manifest

Record:

- plan path
- unit id or title
- explicit file scope
- explicit constraints
- verification target
- stop condition

The manifest is the working contract for the unit.

## 4. Step 3: Inspect The Actual Code Area

Before editing:

- inspect target files
- inspect nearby tests
- inspect neighboring patterns that the unit should follow

This is the last point where context gathering is allowed.

After this, do not let implementation turn back into open-ended repo exploration.

## 5. Step 4: Execute Only The Unit

Implement only what the unit requires.

Allowed:

- the smallest direct changes required to satisfy the unit
- narrow dependency changes that are strictly necessary

Not allowed:

- adjacent cleanup
- opportunistic refactors
- speculative future-proofing
- silent file-scope expansion

If extra work is required, use:

- `templates/work/scope-expansion-request-template.md`

and stop unless the expansion is clearly narrow and justified.

## 6. Step 5: Capture Verification Evidence

Before saying the unit is complete, gather fresh evidence using:

- `templates/work/verification-evidence-template.md`

The evidence must come from this session.

Do not reuse stale output unless the command was rerun after the relevant code changed.

## 7. Step 6: Write The Unit Execution Report

After implementation and verification, write:

- `templates/work/unit-execution-report-template.md`

The report should include:

- what changed
- files changed
- verification evidence
- open findings
- whether scope stayed intact

## 8. Step 7: Route To The Next Skill

Default next step:

- `cmon:review`

If execution uncovered reusable learning:

- follow review with `cmon:compound`

If the unit could not be completed because the plan boundary broke:

- return to `cmon:plan`

## 9. Failure Cases

Stop and surface the issue when:

- the unit boundary is not real in practice
- required verification is unavailable
- a file outside scope is needed and expansion is not narrow
- the change needs product or architectural re-decision

`cmon:work` should fail loudly rather than succeed ambiguously.
