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

## 4. Step 3: Choose The Execution Strategy

Before implementation starts, choose one of:

- `inline`
- `serial`
- `parallel`

Default to `inline`.

Use:

- `templates/work/execution-strategy-template.md`

whenever the strategy is not obvious from the unit itself.

Only choose `parallel` when write scopes are disjoint and dependency order is genuinely absent.

If that is not clearly true, downgrade to `serial` or `inline`.

## 5. Step 4: Inspect The Actual Code Area

Before editing:

- inspect target files
- inspect nearby tests
- inspect neighboring patterns that the unit should follow

This is the last point where context gathering is allowed.

After this, do not let implementation turn back into open-ended repo exploration.

## 6. Step 5: Execute Only The Unit

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

## 7. Step 6: Capture Verification Evidence

Before saying the unit is complete, gather fresh evidence using:

- `templates/work/verification-evidence-template.md`

The evidence must come from this session.

Do not reuse stale output unless the command was rerun after the relevant code changed.

## 8. Step 7: Run System Interaction Check When Needed

If the unit has non-local effects, fill:

- `templates/work/system-interaction-check-template.md`

Run this check when the unit touches callbacks, middleware, retries, failure cleanup, or multi-interface parity.

If the check reveals that the unit's actual impact is larger than the current boundary or current verification, stop and revise before continuing.

## 9. Step 8: Run Spec Compliance Review

After verification succeeds, assemble a packet using:

- `templates/work/spec-compliance-input-template.md`

The goal is to answer:

- did the unit stay aligned with requirements, design, and plan
- does the evidence actually support the unit claim

If the answer is not clearly yes, return to implementation.

Do not move forward just because tests passed.

## 10. Step 9: Run Code-Quality Review

Only after spec compliance is sound, assemble:

- `templates/work/code-quality-review-input-template.md`

The goal is to surface:

- obvious maintainability traps
- weak tests or weak evidence
- incomplete handling inside the approved scope

If material concerns remain, return to implementation and rerun the loop.

## 11. Step 10: Write The Unit Execution Report

After implementation and verification, write:

- `templates/work/unit-execution-report-template.md`

The report should include:

- what changed
- files changed
- verification evidence
- system interaction check result when relevant
- execution strategy
- internal review loop results
- open findings
- whether scope stayed intact

## 12. Step 11: Route To The Next Skill

Record the result using:

- `templates/workflow/stage-transition-decision-template.md`

Default next step:

- `proceed -> cmon:review`

If execution uncovered reusable learning:

- follow review with `cmon:compound`

If the unit could not be completed because the plan boundary broke:

- `block`
- return to `cmon:plan`

If the unit remains correctable inside the same bounded execution slice:

- `revise -> cmon:work`

## 13. Failure Cases

Stop and surface the issue when:

- the unit boundary is not real in practice
- the chosen execution strategy is no longer valid in practice
- required verification is unavailable
- a required system interaction check exposes broader impact than the unit can safely carry
- a file outside scope is needed and expansion is not narrow
- the change needs product or architectural re-decision
- spec compliance review shows plan or design drift
- code-quality review shows material engineering weakness inside the unit

`cmon:work` should fail loudly rather than succeed ambiguously.
