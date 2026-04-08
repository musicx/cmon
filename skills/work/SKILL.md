---
name: cmon:work
description: Use to execute an approved implementation unit within explicit boundaries. Enforces scoped implementation, fresh verification, internal review loops, and no-drift execution.
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
Use `templates/work/execution-strategy-template.md` when the unit needs an explicit choice between inline, serial delegation, and parallel delegation.

## Workflow

1. Read the relevant implementation unit critically
2. Lock the current unit boundary
3. Choose the execution strategy
4. Inspect the affected files, referenced patterns, and nearby tests
5. Honor the unit's `Execution Note` when one exists
6. Implement only what the unit requires
7. If scope expansion appears necessary, stop and record it explicitly
8. Verify the unit with explicit evidence
9. Run internal spec compliance review against requirements, design, and plan
10. If compliance fails, return to the same unit and correct it before proceeding
11. Run internal code-quality review on the completed unit
12. If code quality fails, return to the same unit and correct it before proceeding
13. Record any findings that affect later units or require review
14. Produce a clean handoff package for `cmon:review`

## Execution Posture

The plan is a decision artifact, not a script.

`cmon:work` must:

- treat requirements, design, and plan boundaries as the source of truth
- honor `Execution Note` when a unit is marked test-first or characterization-first
- prefer existing patterns before inventing new structure

If the unit is missing detail that blocks responsible execution, stop and return to `cmon:plan`.

## Execution Strategy

`cmon:work` allows exactly three execution strategies:

1. `inline`
   - one executor handles the unit directly
   - default for single-file or tightly coupled units

2. `serial`
   - bounded sub-steps or delegated units run one after another
   - use when the unit has dependency order but still benefits from narrower focused execution

3. `parallel`
   - multiple delegated sub-steps run concurrently
   - allowed only when write scopes are disjoint and dependency order is genuinely absent

The strategy should be chosen before implementation starts and recorded explicitly for non-trivial units.

`parallel` is never allowed just because the task feels large.

It is allowed only when:

- write scopes do not overlap
- the sub-steps do not depend on each other's unfinished output
- each sub-step can still preserve the approved unit boundary
- the final integrator can review the merged result coherently

## Execution Rules

- Only edit files that are in scope for the current unit, unless a narrow dependency forces expansion
- If scope expansion is required, use `templates/work/scope-expansion-request-template.md` and stop unless the expansion is narrow, justified, and recorded
- Prefer the smallest change that satisfies the unit
- Do not mix unrelated cleanup into the same unit
- Do not silently reinterpret requirements or design intent during execution
- Do not use delegation to hide weak unit boundaries
- Do not use `parallel` when write scopes overlap or when sequencing is ambiguous
- Do not skip system interaction checks when the unit clearly has non-local effects

## Verification Rules

Completion requires evidence from this session.

Acceptable evidence includes:

- targeted test output
- build output
- reproducible command output
- focused manual verification steps when automation is not practical

Use `templates/work/verification-evidence-template.md` as the default structure when evidence needs to be captured explicitly.
Use `templates/work/system-interaction-check-template.md` when the unit has non-local effects such as callbacks, middleware, retries, multi-interface exposure, or failure cleanup risk.

Unacceptable completion language:

- "should work now"
- "probably fixed"
- "done" without evidence

If the plan's test scenarios are obviously incomplete for the unit, supplement them before claiming completion. Do not pretend the missing cases do not exist.

## System Interaction Checks

Some units change behavior beyond the local file or function.

When the unit touches any of the following, run an explicit system interaction check:

- callbacks, observers, hooks, or event handlers
- middleware or request/response pipeline behavior
- retry, fallback, or error propagation behavior
- state persistence before risky downstream calls
- the same behavior exposed through multiple interfaces

The purpose is to catch failures that narrow local verification often misses.

Use `templates/work/system-interaction-check-template.md` to record:

- what else fires when this unit runs
- whether tests exercise the real chain
- whether failure leaves orphaned state
- whether interface parity must be preserved
- whether error strategy is coherent across layers

## Internal Review Loop

Before a unit can hand off to `cmon:review`, it must pass two narrower internal checks:

1. `spec-compliance-review`
   - confirms the implemented unit still matches approved requirements, design, and plan boundaries
   - uses `templates/work/spec-compliance-input-template.md`

2. `code-quality-review`
   - checks maintainability, edge cases, verification sufficiency, and obvious engineering weaknesses inside the approved scope
   - uses `templates/work/code-quality-review-input-template.md`

These are not replacements for `cmon:review`.

They exist to catch obvious drift and weak execution before the change reaches the broader multi-lens review stage.

## Output

For each executed unit, report:

- `Implemented`
- `Files changed`
- `Requirements / Design trace`
- `Verification`
- `Execution strategy`
- `Internal review loop result`
- `Open findings for review`

Use `templates/work/unit-execution-report-template.md` as the default handoff structure.

## Hard Rules

- No unbounded implementation
- No claim of completion without evidence
- No hidden scope expansion
- No hiding plan gaps behind "reasonable assumptions"
- No jumping to adjacent units without closing the current one
- No skipping the internal review loop because the code "looks fine"
- No using `parallel` delegation without explicit disjoint write scopes

## Handoff

Record the handoff using:

- `templates/workflow/stage-transition-decision-template.md`

Typical transition decisions:

- `proceed -> cmon:review`
  - after implementation of a meaningful unit with evidence and internal review completion

If the unit produced reusable learning:

- review may later `proceed -> cmon:compound`

If the unit boundary breaks and cannot be resolved narrowly:

- `block`
- return to `cmon:plan`

If the unit remains correctable inside the same bounded execution slice:

- `revise -> cmon:work`
