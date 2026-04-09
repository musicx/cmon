# cmon Work Operating Procedure v0

Date: 2026-04-07
Status: Draft

This procedure describes how to execute one implementation unit using `cmon:work`.

It is intentionally manual-first.

The goal is to prove the workflow before adding any helper script.

## 1. Inputs

Before starting, collect:

- approved plan path
- approved execution JSON path
- execution JSON task id
- human package approval artifact
- chosen implementation unit
- relevant requirements reference
- nearby files and tests

Then create:

- `templates/work/work-run-manifest-template.md`

## 2. Step 1: Lock The Unit

Read the chosen execution JSON task and matching Markdown plan unit, then restate:

- goal
- files in scope
- constraints
- verification
- done condition

If the execution JSON is missing, invalid, stale, or inconsistent with the Markdown plan, stop and return to:

- `cmon:plan`

Do not start coding from an underspecified unit or mismatched task graph.

Confirm the human package approval artifact is valid before continuing:

- status is `approved` or `waived_by_user`
- `Approved By` names the human
- `User Approval Quote` contains the exact user approval or waiver
- approval was recorded after `cmon:challenge(mode=package)`

If the approval artifact is missing, pending, agent-authored without user evidence, or only inferred from the original task request, stop and request human approval.

## 3. Step 2: Confirm Repo Foundation

Before any edits:

- identify the target repo root or project directory
- confirm it is already a git repo

If the work is substantial greenfield project creation and git is still missing:

- initialize git first
- then continue

Do not start real development in an unversioned project directory.

## 4. Step 3: Decide Isolation First When Needed

Before implementation strategy is finalized, ask whether the current unit should first route through:

- `cmon:worktree`

Do this especially when:

- the working tree already contains unrelated changes
- the unit is risky enough that review should happen against a cleaner diff
- execution will be `parallel`
- the unit is a substantial greenfield slice

If isolation is needed, finish that decision before editing.

## 5. Step 4: Fill The Work Run Manifest

Record:

- plan path
- execution JSON path
- execution JSON task id
- human package approval path
- unit id or title
- explicit file scope
- explicit constraints
- verification target
- stop condition

The manifest is the working contract for the unit.
Mark the execution JSON task `in_progress` before editing starts.

## 6. Step 5: Choose The Execution Strategy

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

If the strategy is `serial` or `parallel`, also write:

- `templates/work/delegated-unit-packet-template.md`

for each delegated slice.

## 7. Step 6: Inspect The Actual Code Area

Before editing:

- inspect target files
- inspect nearby tests
- inspect neighboring patterns that the unit should follow

This is the last point where context gathering is allowed.

After this, do not let implementation turn back into open-ended repo exploration.

## 8. Step 7: Execute Only The Unit

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

## 9. Step 8: Record A Checkpoint When Needed

When execution reaches a risky midpoint, a context switch, or a cluster boundary, write:

- `templates/work/unit-checkpoint-template.md`

Use it to record:

- whether the boundary still holds
- the current execution JSON task status
- whether upstream mismatch is starting to appear
- whether simplification pressure is accumulating

## 10. Step 9: Capture Verification Evidence

Before saying the unit is complete, gather fresh evidence using:

- `templates/work/verification-evidence-template.md`

The evidence must come from this session.

Do not reuse stale output unless the command was rerun after the relevant code changed.

## 11. Step 10: Run System Interaction Check When Needed

If the unit has non-local effects, fill:

- `templates/work/system-interaction-check-template.md`

Run this check when the unit touches callbacks, middleware, retries, failure cleanup, or multi-interface parity.

If the check reveals that the unit's actual impact is larger than the current boundary or current verification, stop and revise before continuing.

## 12. Step 11: Run Spec Compliance Review

After verification succeeds, assemble a packet using:

- `templates/work/spec-compliance-input-template.md`

The goal is to answer:

- did the unit stay aligned with requirements, design, and plan
- does the evidence actually support the unit claim

If the answer is not clearly yes, return to implementation.

Do not move forward just because tests passed.

## 13. Step 12: Run Code-Quality Review

Only after spec compliance is sound, assemble:

- `templates/work/code-quality-review-input-template.md`

The goal is to surface:

- obvious maintainability traps
- weak tests or weak evidence
- incomplete handling inside the approved scope

If material concerns remain, return to implementation and rerun the loop.

## 14. Step 13: Review Simplification Before Handoff

After one risky unit or several related units, explicitly ask:

- has local duplication appeared
- should a shared helper or common path be folded into the current approved boundary
- would the simplification now require a plan change instead

If simplification still fits the approved unit, handle it now.
If it would widen scope materially, route it back to planning rather than silently absorbing it.

## 15. Step 14: Write The Unit Execution Report

After implementation and verification, write:

- `templates/work/unit-execution-report-template.md`

The report should include:

- what changed
- files changed
- execution JSON task status and completion evidence written
- verification evidence
- system interaction check result when relevant
- execution strategy
- checkpoint path when one exists
- internal review loop results
- simplification follow-ups
- open findings
- whether scope stayed intact

## 16. Step 15: Route To The Next Skill

Record the result using:

- `templates/workflow/stage-transition-decision-template.md`

Default next step:

- `proceed -> cmon:verify`

If execution uncovered reusable learning:

- follow verification with `cmon:compound`

If the unit could not be completed because the plan boundary broke:

- `block`
- return to `cmon:plan`

If the unit remains correctable inside the same bounded execution slice:

- `revise -> cmon:work`

## 17. Failure Cases

Stop and surface the issue when:

- the target project directory still is not a git repo when real development should begin
- the human package approval artifact is missing
- the human package approval artifact is pending, inferred, agent-authored without user evidence, or otherwise invalid
- execution JSON is missing, invalid, stale, or inconsistent with the Markdown plan
- the unit boundary is not real in practice
- the chosen execution strategy is no longer valid in practice
- a delegated slice no longer fits its packet
- required verification is unavailable
- a required system interaction check exposes broader impact than the unit can safely carry
- a file outside scope is needed and expansion is not narrow
- the change needs product or architectural re-decision
- spec compliance review shows plan or design drift
- code-quality review shows material engineering weakness inside the unit
- simplification now requires a structural plan change rather than a local cleanup

`cmon:work` should fail loudly rather than succeed ambiguously.
