# cmon Work Execution v0

Date: 2026-04-07
Status: Draft

This document defines the current execution scaffolding for `cmon:work`.

Its job is to turn plan units into bounded implementation runs with an internal review loop before broader review.

## 1. Purpose

`cmon:work` is the most constraint-sensitive part of `cmon`.

This layer exists to prevent the failures that usually happen during implementation:

- scope drift
- invisible boundary expansion
- mixing unrelated cleanup into one unit
- claiming completion without evidence
- handing weak or ambiguous state into review

## 2. What cmon:work Must Do

For each execution unit, `cmon:work` must:

1. load an approved unit from the plan
2. restate the unit boundary explicitly
3. execute only within that boundary
4. produce fresh verification evidence
5. run internal spec compliance review
6. run internal code-quality review
7. report what changed and what still needs review

If it cannot do one of those seven things, it should stop and surface the problem.

## 3. Required Inputs

`cmon:work` should begin from one unit, not from the whole plan at once.

Minimum inputs:

- approved plan path
- unit identifier or unit title
- files or modules in scope
- constraints
- verification target
- stop condition

Preferred explicit manifest:

- `templates/work/work-run-manifest-template.md`

## 4. Output Artifacts

`cmon:work` should standardize six work artifacts.

### 4.1 Work Run Manifest

Used before editing starts.

Purpose:

- declare the exact unit being executed
- lock scope and constraints
- define verification before implementation starts

Template:

- `templates/work/work-run-manifest-template.md`

### 4.2 Scope Expansion Request

Used when execution reveals that the plan boundary is too narrow.

Purpose:

- force explicit acknowledgment of boundary expansion
- prevent "while I'm here" improvisation

Template:

- `templates/work/scope-expansion-request-template.md`

### 4.3 Verification Evidence

Used after code changes but before claiming completion.

Purpose:

- capture fresh evidence from the current session
- separate evidence from interpretation

Template:

- `templates/work/verification-evidence-template.md`

### 4.4 Spec Compliance Review Input

Used after verification and before final handoff.

Purpose:

- compare the implemented unit against requirements, design, and plan intent
- detect boundary drift before broader review

Template:

- `templates/work/spec-compliance-input-template.md`

### 4.5 Code Quality Review Input

Used only after spec compliance review passes.

Purpose:

- inspect the finished unit for maintainability, coverage gaps, and weak verification
- catch obvious engineering issues before external review

Template:

- `templates/work/code-quality-review-input-template.md`

### 4.6 Unit Execution Report

Used at the end of the unit.

Purpose:

- summarize implementation state
- hand cleanly into `cmon:review`

Template:

- `templates/work/unit-execution-report-template.md`

## 5. Execution States

Every work unit should be in one of these states:

- `ready`
- `in_progress`
- `blocked`
- `awaiting_scope_decision`
- `awaiting_review`
- `complete`

These states are intentionally simple.

They are not a project-management system. They are execution discipline.

## 6. Stop Conditions

`cmon:work` must stop and surface the issue when:

- the current unit boundary is unclear
- required files are out of scope
- verification cannot be run as planned
- a failing dependency invalidates the unit
- the work now requires product or architectural re-decision

This is a core `cmon` policy:

stop instead of freelancing.

## 7. Scope Expansion Policy

Scope expansion is allowed only when all of these are true:

1. the extra work is directly required for the current unit
2. the added file or change is narrow and explainable
3. the original unit goal does not change
4. the expansion is recorded explicitly

If those conditions are not met, execution should stop and return to:

- `cmon:plan`

## 8. Verification Policy

This is heavily influenced by `superpowers`:

- no completion claim without fresh evidence
- no substitution of confidence for proof
- no relying on earlier runs when the current unit changed code

Acceptable evidence includes:

- targeted test output
- build output
- reproducible command output
- focused manual verification with concrete steps and observed result

Weak evidence includes:

- "should work now"
- "looks right"
- "tests passed earlier"
- "no obvious problem"

`cmon:work` should preserve evidence in a dedicated verification artifact or report section.

## 9. Handoff Contract To Review

At the end of a meaningful unit, `cmon:work` should hand `cmon:review` a package containing:

- plan path
- executed unit id
- files changed
- constraints actually observed
- verification evidence
- any open findings or uncertainty

The point is to make `cmon:review` judge the actual executed unit, not reconstruct it from chat memory.

## 10. Internal Review Loop

This is the main v0.1 upgrade inspired by the strongest part of `superpowers`.

After implementation and verification, `cmon:work` should run two narrow reviews:

1. spec compliance review
2. code-quality review

The order matters.

Spec compliance comes first because a beautifully written change that violates the approved intent is still wrong.

Code-quality review comes second because it should assess the right implementation, not a drifting one.

### 10.1 Spec Compliance Review

This review asks:

- does the unit still match approved requirements
- does it preserve approved design intent
- does it stay inside the plan boundary
- do the verification results actually support the claimed unit outcome

Typical failure modes:

- hidden expansion beyond the approved unit
- quiet reinterpretation of behavior
- skipping an edge case the unit explicitly required
- evidence that does not prove the actual claim

### 10.2 Code-Quality Review

This review asks:

- is the unit understandable and maintainable
- are the main edge cases handled inside the approved scope
- are tests and verification appropriately strong for the change
- did the implementation create obvious future hazards

Typical failure modes:

- brittle structure or unclear ownership
- weak or misleading tests
- obvious maintainability traps
- partial completion hidden behind passing narrow checks

### 10.3 Outcome Routing

If spec compliance fails:

- return to the current unit immediately
- do not continue to code-quality review
- do not hand off to `cmon:review`

If code-quality review fails:

- return to the current unit immediately
- rerun verification if the fix changes relevant behavior
- rerun the review loop before external handoff

If both pass:

- write the unit execution report
- move to `cmon:review`

## 11. Why This Matches cmon Philosophy

This design keeps the strongest part of `superpowers`:

- bounded execution
- verification before completion
- stop-on-drift behavior
- internal review before broader signoff

while preserving the broader `cmon` chain:

- review after implementation
- compound when reusable learning appears

It strengthens discipline without requiring a large runtime.

## 12. Next Step

This contract now has matching operating docs:

- `docs/architecture/2026-04-07-work-operating-procedure-v0.md`
- `docs/architecture/2026-04-07-work-review-loop-v0.md`

It is also exercised by this end-to-end example:

- `docs/architecture/2026-04-07-e2e-example-core-skill-routing-matrix.md`

The next useful additions are:

1. execution strategy selection for inline, serial, or parallel unit delivery
2. stronger system-wide interaction checks
3. a second example run that exercises scope expansion or a blocked unit
