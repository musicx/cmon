# cmon Work Execution v0

Date: 2026-04-07
Status: Draft

This document defines the current execution scaffolding for `cmon:work`.

Its job is to turn plan units into bounded implementation runs with explicit strategy choice, system interaction checks, and an internal review loop before broader review.

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
3. choose an execution strategy that fits the unit
4. execute only within that boundary
5. produce fresh verification evidence
6. run system interaction checks when the unit has non-local effects
7. run internal spec compliance review
8. run internal code-quality review
9. report what changed and what still needs review

If it cannot do one of those nine things, it should stop and surface the problem.

## 3. Required Inputs

`cmon:work` should begin from one unit, not from the whole plan at once.

Minimum inputs:

- approved plan path
- unit identifier or unit title
- files or modules in scope
- constraints
- execution strategy
- verification target
- system interaction check requirement
- stop condition

Preferred explicit manifest:

- `templates/work/work-run-manifest-template.md`

## 4. Output Artifacts

`cmon:work` should standardize eight work artifacts.

### 4.1 Work Run Manifest

Used before editing starts.

Purpose:

- declare the exact unit being executed
- lock scope and constraints
- record the chosen execution strategy
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

### 4.3 Execution Strategy Record

Used before implementation when the execution mode is not trivially obvious.

Purpose:

- choose between `inline`, `serial`, and `parallel`
- justify delegation boundaries before coding begins
- force explicit write-scope checks before allowing `parallel`

Template:

- `templates/work/execution-strategy-template.md`

### 4.4 Verification Evidence

Used after code changes but before claiming completion.

Purpose:

- capture fresh evidence from the current session
- separate evidence from interpretation

Template:

- `templates/work/verification-evidence-template.md`

### 4.5 System Interaction Check

Used when the unit has non-local effects.

Purpose:

- force explicit inspection of callbacks, middleware, retries, state cleanup, and interface parity when relevant
- close the gap between local verification and actual system behavior

Template:

- `templates/work/system-interaction-check-template.md`

### 4.6 Spec Compliance Review Input

Used after verification and before final handoff.

Purpose:

- compare the implemented unit against requirements, design, and plan intent
- detect boundary drift before broader review

Template:

- `templates/work/spec-compliance-input-template.md`

### 4.7 Code Quality Review Input

Used only after spec compliance review passes.

Purpose:

- inspect the finished unit for maintainability, coverage gaps, and weak verification
- catch obvious engineering issues before external review

Template:

- `templates/work/code-quality-review-input-template.md`

### 4.8 Unit Execution Report

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

## 6. Execution Strategy Policy

`cmon:work` allows only three execution strategies:

- `inline`
- `serial`
- `parallel`

### 6.1 Inline

Use when:

- the unit is small
- the files are tightly coupled
- the coordination cost of delegation is higher than the execution gain

This should remain the default unless there is a real reason to delegate.

### 6.2 Serial

Use when:

- the unit contains sub-steps with a clear dependency order
- narrower focused execution would improve quality
- one sub-step's output becomes another sub-step's input

This is the safest delegation mode.

### 6.3 Parallel

Use only when:

- sub-steps have disjoint write scopes
- sub-steps do not depend on each other's in-flight output
- the unit can still be reviewed coherently after merge

If any of those are false or unclear:

- do not use `parallel`

### 6.4 Policy Choice

This is intentionally narrower than `ce:work`.

`cmon` does not support free-form delegation based only on task size or vague intuition.

The strategy must serve the unit boundary, not weaken it.

## 7. System Interaction Check Policy

Some units need more than local verification.

Run the system interaction check when the unit touches:

- callbacks, observers, hooks, or event handlers
- middleware or request chain logic
- retries, fallbacks, or layered error handling
- persistence before external calls or risky side effects
- multiple interfaces that should preserve parity

The check should answer:

- what else fires when this unit runs
- whether tests exercise the real chain
- whether failure leaves orphaned state or duplicate risk
- whether interface parity must be preserved
- whether error strategies align across layers

This is the main place where `cmon` borrows from the strongest system-awareness parts of `ce:work` without inheriting its broader execution model.

## 8. Stop Conditions

`cmon:work` must stop and surface the issue when:

- the current unit boundary is unclear
- required files are out of scope
- verification cannot be run as planned
- a required system interaction check cannot be completed responsibly
- a failing dependency invalidates the unit
- the work now requires product or architectural re-decision

This is a core `cmon` policy:

stop instead of freelancing.

## 9. Scope Expansion Policy

Scope expansion is allowed only when all of these are true:

1. the extra work is directly required for the current unit
2. the added file or change is narrow and explainable
3. the original unit goal does not change
4. the expansion is recorded explicitly

If those conditions are not met, execution should stop and return to:

- `cmon:plan`

## 10. Verification Policy

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

## 11. Handoff Contract To Review

Use:

- `templates/workflow/stage-transition-decision-template.md`

At the end of a meaningful unit, `cmon:work` should hand `cmon:review` a package containing:

- plan path
- executed unit id
- files changed
- constraints actually observed
- verification evidence
- system interaction check result when relevant
- any open findings or uncertainty

The point is to make `cmon:review` judge the actual executed unit, not reconstruct it from chat memory.

## 12. Internal Review Loop

This is the main v0.1 upgrade inspired by the strongest part of `superpowers`.

After implementation and verification, `cmon:work` should run two narrow reviews:

1. spec compliance review
2. code-quality review

The order matters.

Spec compliance comes first because a beautifully written change that violates the approved intent is still wrong.

Code-quality review comes second because it should assess the right implementation, not a drifting one.

### 12.1 Spec Compliance Review

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

### 12.2 Code-Quality Review

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

### 12.3 Outcome Routing

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

## 13. Why This Matches cmon Philosophy

This design keeps the strongest part of `superpowers`:

- bounded execution
- verification before completion
- stop-on-drift behavior
- internal review before broader signoff
- explicit execution-mode choice before delegation

while preserving the broader `cmon` chain:

- review after implementation
- compound when reusable learning appears

and adds one of the strongest practical parts of `ce:work`:

- explicit checking for non-local system effects

It strengthens discipline without requiring a large runtime.

## 14. Next Step

This contract now has matching operating docs:

- `docs/architecture/2026-04-07-work-operating-procedure-v0.md`
- `docs/architecture/2026-04-07-work-review-loop-v0.md`

It is also exercised by this end-to-end example:

- `docs/architecture/2026-04-07-e2e-example-core-skill-routing-matrix.md`
- `docs/architecture/2026-04-07-e2e-example-routing-matrix-refresh-v1.md`
- `docs/architecture/2026-04-07-e2e-example-stage-ownership-parallel-v1.md`
- `docs/architecture/2026-04-07-e2e-example-proof-coverage-scope-expansion-v1.md`

The next useful additions are:

1. a blocked example only if the current narrow-expansion proof is not enough
2. a code-changing `parallel` example only if the docs-first proof starts to look too weak
