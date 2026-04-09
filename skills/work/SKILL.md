---
name: cmon:work
description: Use to execute an approved implementation unit within explicit boundaries. Enforces scoped implementation, fresh verification, internal review loops, and no-drift execution.
---

# cmon:work

Implement approved work without drifting beyond the plan.

This skill is intentionally more restrictive than a generic coding workflow.

Its job is not to "see what happens." Its job is to execute against approved boundaries and return with evidence.

## Preconditions

Do not use this skill unless all required package artifacts exist:

- a human package approval in `docs/approvals/`
- an approved Markdown plan in `docs/plans/`
- a clearly approved, tightly bounded work unit derived from that plan
- the approved plan's execution JSON

If the human package approval is missing, stop before implementation and route back to `cmon:challenge(mode=package)` or the human approval gate.
If the plan or execution JSON is missing or inconsistent, go back to `cmon:plan`.

Before any real development begins, confirm the target project area is already a git repo.

If the work is substantial greenfield project creation and no git repo exists yet:

- initialize git first
- then continue with the bounded unit

## Required Inputs

Before implementation starts, identify:

1. The plan or work unit being executed
2. The execution JSON task or phase being executed
3. The human package approval artifact
4. The originating requirements and design artifacts when relevant
5. Files or modules in scope
6. Explicit constraints
7. Patterns to follow
8. Verification target
9. Stop condition
10. Whether the current unit should first route through `cmon:worktree`

Use `templates/work/work-run-manifest-template.md` as the default way to lock the unit before coding when the execution boundary needs to be made explicit.
Use `templates/work/execution-strategy-template.md` when the unit needs an explicit choice between inline, serial delegation, and parallel delegation.
Use `templates/work/delegated-unit-packet-template.md` whenever `serial` or `parallel` execution delegates a bounded slice to a sub-executor.
Use `templates/work/unit-checkpoint-template.md` to record a meaningful unit checkpoint before a context switch, after a risky slice, or after several related units accumulate simplification pressure.

## Workflow

1. Read the relevant implementation unit critically
2. Read the corresponding execution JSON task
3. Confirm human package approval exists
4. Confirm repo foundation before editing anything
5. Decide whether the unit should first use `cmon:worktree`
6. Lock the current unit boundary
7. Choose the execution strategy
8. If delegating, write the delegated unit packet before execution starts
9. Inspect the affected files, referenced patterns, and nearby tests
10. Honor the unit's `Execution Note` when one exists
11. Mark the JSON task `in_progress`
12. Implement only what the unit requires
13. If scope expansion appears necessary, stop and record it explicitly
14. Write a checkpoint when the unit reaches a risky midpoint, a context switch, or cluster boundary
15. Verify the unit with explicit evidence
16. Run internal spec compliance review against requirements, design, and plan
17. If compliance fails, return to the same unit and correct it before proceeding
18. Run internal code-quality review on the completed unit
19. If code quality fails, return to the same unit and correct it before proceeding
20. Record simplification opportunities once several related units accumulate
21. Update the JSON task status, completion evidence, and blockers
22. Record any findings that affect later units or require review
23. Produce a clean handoff package for `cmon:verify`

## Execution Posture

The plan is a decision artifact, not a script.

`cmon:work` must:

- treat requirements, design, and plan boundaries as the source of truth
- honor `Execution Note` when a unit is marked test-first or characterization-first
- prefer existing patterns before inventing new structure

If the unit is missing detail that blocks responsible execution, stop and return to `cmon:plan`.
If the execution JSON is missing, stale, or inconsistent with the Markdown plan, stop and return to `cmon:plan`.

Before editing, explicitly consider `cmon:worktree`.

Treat `cmon:worktree` as the default route when:

- the working tree already carries unrelated changes
- the unit is risky enough that review should happen against a cleaner diff
- the execution strategy is `parallel`
- the unit is a substantial greenfield slice that should not share a noisy default workspace

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

When the strategy is `serial` or `parallel`, every delegated slice must receive a packet that preserves:

- the parent unit goal
- exact file scope
- constraints
- verification target
- stop condition

`parallel` is never allowed just because the task feels large.

It is allowed only when:

- write scopes do not overlap
- the sub-steps do not depend on each other's unfinished output
- each sub-step can still preserve the approved unit boundary
- the final integrator can review the merged result coherently

## Execution Rules

- Only edit files that are in scope for the current unit, unless a narrow dependency forces expansion
- Do not start editing inside a new substantial project directory that still lacks git initialization
- If scope expansion is required, use `templates/work/scope-expansion-request-template.md` and stop unless the expansion is narrow, justified, and recorded
- Prefer the smallest change that satisfies the unit
- Do not mix unrelated cleanup into the same unit
- Do not silently reinterpret requirements or design intent during execution
- Do not use delegation to hide weak unit boundaries
- Do not use `parallel` when write scopes overlap or when sequencing is ambiguous
- Do not skip system interaction checks when the unit clearly has non-local effects
- Do not delegate a sub-slice without an explicit delegated unit packet
- Do not continue across several related units without recording at least one checkpoint
- Do not ignore repeated simplification pressure when the same pattern has now appeared across related completed units

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

Before a unit can hand off to `cmon:verify`, it must pass two narrower internal checks:

1. `spec-compliance-review`
   - confirms the implemented unit still matches approved requirements, design, and plan boundaries
   - uses `templates/work/spec-compliance-input-template.md`

2. `code-quality-review`
   - checks maintainability, edge cases, verification sufficiency, and obvious engineering weaknesses inside the approved scope
   - uses `templates/work/code-quality-review-input-template.md`

These are not replacements for `cmon:verify`.

They exist to catch obvious drift and weak execution before the change reaches the explicit verification stage.

## Incremental Development And Simplification

`cmon:work` should borrow a lighter version of the strongest execution habits from mature systems:

- record meaningful unit checkpoints instead of relying on one long opaque implementation burst
- review simplification opportunities after several related units or before a context switch

This does **not** force a git commit after every unit.

It does require an inspectable checkpoint when:

- a risky unit is partially complete
- execution is about to switch context
- several related units have accumulated local duplication or cleanup pressure

Use `templates/work/unit-checkpoint-template.md`.

If simplification clearly belongs inside the current approved boundary, handle it before handoff.
If simplification would widen scope materially, route it to a later unit or back to `cmon:plan`.

## Escalation Rules

Stop and route upstream when any of these become true:

- the unit depends on an unstated product or behavioral decision
- the required verification target no longer fits inside the approved unit boundary
- a file outside scope is now required in a non-narrow way
- the chosen `parallel` or `serial` strategy is no longer valid in practice
- the same symptom or execution blocker survives one attempted local repair and root cause is still uncertain
- simplification now requires a structural plan change rather than a local cleanup

Use the shared reflow rule:

- framing or missing intent -> `cmon:think`
- behavior or boundary truth -> `cmon:design`
- unit structure, sequencing, or verification strategy -> `cmon:plan`
- local code or evidence defect -> remain in `cmon:work`

## Output

For each executed unit, report:

- `Implemented`
- `Files changed`
- `Requirements / Design trace`
- `Verification`
- `Execution strategy`
- `Checkpoint path` when one exists
- `Execution JSON status update`
- `Internal review loop result`
- `Simplification follow-ups`
- `Open findings for verify or broader review`

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

- `proceed -> cmon:verify`
  - after implementation of a meaningful unit with evidence and internal review completion

If the unit produced reusable learning:

- verify may later `proceed -> cmon:compound`

If the unit boundary breaks and cannot be resolved narrowly:

- `block`
- return to `cmon:plan`

If the unit remains correctable inside the same bounded execution slice:

- `revise -> cmon:work`
